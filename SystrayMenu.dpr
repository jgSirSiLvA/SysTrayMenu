program SystrayMenu;

uses
  Forms,
  main in 'main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TfrmMain, frmMain);
  Application.ShowMainForm := False;
  Application.Run;
end.
