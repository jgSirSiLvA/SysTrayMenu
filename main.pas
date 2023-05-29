unit main;

interface

uses Windows, Classes, Controls, Dialogs, ExtCtrls, Forms, Graphics, IniFiles, Menus, Messages, ShellAPI, StdCtrls, SysUtils;

type
  TfrmMain = class(TForm)
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    MenuItemDevider: TMenuItem;
    MenuItemDisplayHide: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemRefresh: TMenuItem;
    LblInfo: TLabel;
    procedure TrayIconMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure MenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var frmMain: TfrmMain;

Const Version = '4.1 (23.05.2023)';
Const myDivider: String = ', ';

implementation

{$R *.dfm}

function DateTimeStr: String;
Begin
  Result := StringReplace(TimeToStr(Now), ':', '', [rfReplaceAll, rfIgnoreCase]);
End;

// replace an EnvVar like %Commander_Path% inside a string
function ReplaceEnvVar(FileName: String): String;
 var Stelle, Stelle2: Integer;
begin
 Stelle  := Pos('%', Filename);
 Stelle2 := Pos('%', Copy(Filename, Stelle+1, Length(Filename)));
 If (Stelle <> 0) And (Stelle2 <> 0) Then
  Result := Copy(FileName, 1, Stelle - 1) + GetEnvironmentVariable(Copy(FileName, Stelle + 1, Stelle2 - 1)) + Copy(FileName, Stelle2 + Stelle + 1, Length(FileName))
 Else
  Result := FileName;
end;

// good old php explode function in delphi
function Explode(Divider, Line: String): TSTringList;
begin
  Result := TSTringList.Create;
  while Pos(Divider, Line) > 0 do
   begin
    Result.Add(Copy(Line, 1, Pos(Divider, Line) - 1));
    Line := Copy(Line, Pos(Divider, Line) + Length(Divider), Length(Line));
   end;
  Result.Add(Copy(Line, 1, Length(Line)));
end;

// ShowMessage replacement as it is bugged now and does NOT show what you tell it to!
procedure ShowMsg(Text: String; Caption: String = '');
Begin
 if (Caption = '') then Caption := frmMain.Caption;
 MessageBox( Application.Handle, PChar(Text), PChar(Caption), MB_OK);
End;

//gets a picture-file and returns a BMP
function TurnPicIntoBmp(FileName: String): TBitmap;
 var myImage: TImage;
Begin
 if FileExists(FileName) then
  Begin
   myImage := TImage.Create(frmMain);
   myImage.Picture.LoadFromFile(FileName);
   Result := TBitmap.Create;
   Result.Width:=myImage.Picture.Width;
   Result.Height:=myImage.Picture.Height;
   Result.PixelFormat:=pf24bit;
   Result.Canvas.Draw(0, 0, myImage.Picture.Graphic);
   myImage.Free;
  End
 else
  Result := nil;
End;

//gets an exe/dll/icl-FileName and returns the (fileName,x)th icon of that file as BMP
function TurnExeIntoBmp(FileName: String): TBitmap;
 var IconIndex: word;
 var Buffer: array[0..2048] of char;
 var IconHandle: HIcon;
 var Icon: TIcon;
begin
 IconIndex := 0;

 if (Pos(',', FileName) > 0) then
  Begin
   IconIndex := StrToInt(Trim(Copy(FileName, Pos(',', FileName) + 1, Length(FileName))));
   FileName := Copy(FileName, 1, Pos(',', FileName) - 1);
  End;

 if FileExists(Filename) then
  Begin
   Icon := TIcon.Create;
   StrCopy(@Buffer, PChar(FileName));
   IconHandle := ExtractAssociatedIcon(HInstance, Buffer, IconIndex);
   if IconHandle <> 0 then Icon.Handle := IconHandle;
   Result := TBitmap.Create;
   Result.Width := Icon.Width;
   Result.Height := Icon.Height;
   Result.Canvas.Draw(0, 0, Icon);
   if (Icon = nil) then Result := nil;
  End
 Else
  Result := nil;
End;

// creates a menu from FileName
procedure ReadAndCreateMenu(FileName: String);
 var Schleife: Integer;
 var MenuFile, MenuLine: TSTringList;
 var myMenuItem, mySubMenuItem: TMenuItem;
Begin
 mySubMenuItem := frmMain.PopUpMenu.Items;
 MenuFile      := TSTringList.Create;
//item, Title, Exe, Parameters, Icon

 if FileExists(FileName) then MenuFile.LoadFromFile(FileName);

 for Schleife := 0 to (MenuFile.Count - 1) do
  Begin
   MenuLine := Explode(myDivider, MenuFile.Strings[Schleife]);
   if (MenuLine.Strings[0] = 'item') or (MenuLine.Strings[0] = 'sub_start') then
    begin
     myMenuItem         := TMenuItem.Create(mySubMenuItem);
     myMenuItem.Caption := Trim(MenuLine.Strings[1]);
     if (MenuLine.Count > 2) then myMenuItem.Hint := Trim(ReplaceEnvVar(MenuLine.Strings[2]));
     if (MenuLine.Count > 3) then myMenuItem.Hint := myMenuItem.Hint + myDivider + Trim(MenuLine.Strings[3]);
     if (MenuLine.Count > 4) then
       Begin
        MenuLine.Strings[4] := Trim(ReplaceEnvVar(MenuLine.Strings[4]));
        if (LowerCase(ExtractFileExt(MenuLine.Strings[4])) = '.exe') then myMenuItem.Bitmap := TurnExeIntoBmp(MenuLine.Strings[4]);
        if (LowerCase(ExtractFileExt(MenuLine.Strings[4])) = '.bmp') then myMenuItem.Bitmap.LoadFromFile(MenuLine.Strings[4])
        else myMenuItem.Bitmap := TurnPicIntoBmp(MenuLine.Strings[2]);
       End
     else
      if (MenuLine.Count > 2) Then myMenuItem.Bitmap := TurnExeIntoBmp(ReplaceEnvVar(MenuLine.Strings[2]));

     myMenuItem.Name := 'AMenuItem' + DateTimeStr + 'FU' + IntToStr(random(500)) +IntToStr(Schleife);
     myMenuItem.Tag  := Schleife + 1;

     if (MenuLine.Strings[0] = 'item') and (MenuLine.Strings[1] <> '-') then myMenuItem.OnClick := frmMain.MenuClick;
     mySubMenuItem.Insert(0, myMenuItem);
     if (MenuLine.Strings[0] = 'sub_start') then mySubMenuItem := myMenuItem;
    end;

   if MenuLine.Strings[0] = 'sub_end' then mySubMenuItem := mySubMenuItem.Parent;

   if MenuLine.Strings[0] = 'note' then
    if MenuLine.Count > 1 then
     Begin
      frmMain.lblInfo.Caption := frmMain.lblInfo.Caption + #13 + MenuLine.Strings[1];
      frmMain.Height   := frmMain.lblInfo.Height + 50;
      frmMain.Width    := frmMain.lblInfo.Width + 25;
      frmMain.Position := poScreenCenter;
     End;
  End;
 MenuFile.Free;
End;

procedure ReadAndCreateBarFile(FileName: String; mySubMenuItem: TMenuItem; DoMain: Boolean = false);
 var Counter, Schleife: Integer;
 var Ini: TIniFile;
 var myMenuItem: TMenuItem;
 var Cmd: String;
Begin

 Ini := TIniFile.Create(FileName);
 Counter := Ini.ReadInteger('Buttonbar', 'Buttoncount' , 0);

 if (Counter > 0) then
  begin

   if DoMain then
    begin
     myMenuItem         := TMenuItem.Create(mySubMenuItem);
     myMenuItem.Caption := 'BAR: ' + ChangeFileExt(ExtractFileName(FileName), '');
     myMenuItem.Name    := 'BMenuItemBar' + DateTimeStr + '0';
     myMenuItem.Tag     := 0;
     mySubMenuItem.Insert(0, myMenuItem);
     mySubMenuItem      := myMenuItem;
    end;

  for Schleife := Counter DownTo 1 do
   begin
    myMenuItem         := TMenuItem.Create(mySubMenuItem);
    myMenuItem.Caption := Ini.ReadString('Buttonbar', 'menu' + IntToStr(Schleife), '-');
    myMenuItem.Name    := 'BMenuItemBar' + DateTimeStr + IntToStr(Schleife);
    myMenuItem.Tag     := Schleife;

    Cmd := ReplaceEnvVar(Ini.ReadString('Buttonbar', 'cmd' + IntToStr(Schleife), ''));
    myMenuItem.Hint    := Cmd;
    myMenuItem.Hint    := myMenuItem.Hint + myDivider + Ini.ReadString('Buttonbar', 'param' + IntToStr(Schleife), '');
    myMenuItem.Bitmap := TurnExeIntoBmp(ReplaceEnvVar(Ini.ReadString('Buttonbar', 'button' + IntToStr(Schleife), '')));

    if (Pos('.bar', LowerCase(Cmd)) > 0) then ReadAndCreateBarFile(Cmd, myMenuItem)
    else myMenuItem.OnClick := frmMain.MenuClick;

    mySubMenuItem.Insert(0, myMenuItem);
   end;
  end;

End;

//****************************************************************************************************************************
procedure TfrmMain.FormCreate(Sender: TObject);
begin
 MenuClick(MenuItemRefresh);
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = vk_escape then close;
 If (Chr(Key) = 'M') and (Shift = [ssCtrl]) Then frmMain.PopupMenu.Popup((frmMain.Left + 15), (frmMain.Top + 25));
 If (Chr(Key) = 'R') and (Shift = [ssCtrl]) Then MenuClick(MenuItemRefresh);
 If (Chr(Key) = 'H') and (Shift = [ssCtrl]) Then MenuClick(MenuItemDisplayHide);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
 var TempPath: String;
 var BatFile: TSTringList;

 Function ExecuteAndWait(Filename: String; Params: String = ''): Boolean;
  Var SUInfo: TStartupInfo;
  Var ProcInfo: TProcessInformation;
  Var CmdLine: String;
 Begin
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  With SUInfo Do
   Begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := 0;
   End;
  Result := CreateProcess(NIL, PChar(CmdLine), NIL, NIL, FALSE, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, NIL, PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
 //97: ShellExecute(frmMain.Handle,'open',PChar('rundll32.exe'),PChar('shell32.dll,Control_RunDLL hotplug.dll'),nil,SW_SHOWNORMAL);
  If Result Then WaitForSingleObject(ProcInfo.hProcess, INFINITE);
 End;

begin
 BatFile:= TSTringList.Create;
 BatFile.Add('@Echo Off');
 BatFile.Add('start rundll32.exe shell32.dll,Control_RunDLL hotplug.dll');
 BatFile.Add('Exit');
 TempPath := ReplaceEnvVar('%TEMP%');

 If (frmMain.Tag = 23) Then
  Begin
//   BatFile.SaveToFile(TempPath + 'pd.bat');
//   If (Not ExecuteAndWait(TempPath + 'pd.bat')) Then ShowMsg('Error: Could not execute the batch!');
   ShellExecute(frmMain.Handle,'open',PChar('rundll32.exe'),PChar('shell32.dll,Control_RunDLL hotplug.dll'),nil,SW_SHOWNORMAL);
//   DeleteFile(TempPath + 'pd.bat')
  End;

 BatFile.Free;
end;

//****************************************************************************************************************************

procedure TfrmMain.TrayIconMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if Button = mbLeft then MenuClick(MenuItemDisplayHide);

 if Button = mbMiddle then
  begin
   frmMain.Tag := 23;
   close;
  end;

 //if Button = mbRight then PopupMenu
end;

Procedure TfrmMain.MenuClick(Sender: TObject);
 var Schleife: Integer;
 var Cmd, Param: String;
begin

With Sender As TMenuItem Do
 Begin

  if (Name = 'MenuItemExit') then Close;

  if (Name = 'MenuItemDisplayHide') then
   Begin
    frmMain.Visible := not frmMain.Visible;
    if Caption = '&Show' then Caption := '&Hide'
    else Caption := '&Show';
   End;

  if (Name = 'MenuItemRefresh') then
   Begin
    lblInfo.Caption := 'Coded with Delphi Version 11.3' + #13 + ' by Jens ''Sir SiLvA'' Grohmann.' + #13 + '       Version ' + Version;

    for schleife := (frmMain.popupmenu.Items.Count- 1) downto 0 Do
     begin
      if (Pos('AMenuItem', frmMain.popupmenu.Items[schleife].name) > 0) then
       FreeAndNil(frmMain.popupmenu.Items[schleife]);
      if (Pos('BMenuItem', frmMain.popupmenu.Items[schleife].name) > 0) then
       FreeAndNil(frmMain.popupmenu.Items[schleife]);
     end;

    if (ParamCount > 0) then
     for Schleife := 1 to ParamCount do
      begin
       If (LowerCase(ExtractFileExt(ParamStr(Schleife))) = '.menu') then ReadAndCreateMenu(ReplaceEnvVar(ParamStr(Schleife)));
       If (LowerCase(ExtractFileExt(ParamStr(Schleife))) = '.bar')  then ReadAndCreateBarFile(ParamStr(Schleife), frmMain.PopupMenu.Items, true);
      end;
     for Schleife := 1 to 10 do DateTimeStr;

     ReadAndCreateMenu(ChangeFileExt(ParamStr(0), '.menu'));
   End;

  if (Name <> 'MenuItemDisplayHide') and (Name <> 'MenuItemRefresh') and (Name <> 'MenuItemExit') then
   Begin
    Schleife := Pos(myDivider, Hint);
    Cmd := Copy(Hint, 1, Schleife - 1);
    Param:= Copy(Hint, Schleife + Length(myDivider), Length(Hint));
    if (Cmd = '') and (Param <> '') then
    ShellExecute(0, 'open', PChar(Param), PChar(''), nil, SW_SHOWNORMAL)
    else ShellExecute(0, 'open', PChar(Cmd), PChar(Param), nil, SW_SHOWNORMAL);
   End;

 End;
end;

end.


