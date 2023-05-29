object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'SystrayMenu'
  ClientHeight = 73
  ClientWidth = 292
  Color = 16678239
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PopupMenu = PopupMenu
  PopupMode = pmAuto
  Position = poScreenCenter
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object LblInfo: TLabel
    Left = 4
    Top = 4
    Width = 37
    Height = 15
    Caption = 'LblInfo'
  end
  object TrayIcon: TTrayIcon
    Hint = 'SystrayMenu'
    Icon.Data = {
      0000010001002020000001002000A81000001600000028000000200000004000
      000001002000000000008010000000000000000000000000000000000000AFAF
      AFFFB7B7B7FFC2C2C2FFCBCBCBFFFFFFFFFFB2B2B2FFD1D1D1FFD0D0D0FFD0D0
      D0FFCBCBCBFFA3A3A3FF868686FF979797FFB6B6B6FF7B7B7BFF000000B30000
      00830000003C0000000C00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A7A7
      A7FFAEAEAEFFB7B7B7FFC1C1C1FFC9C9C9FFFFFFFFFFAFAFAFFFCDCDCDFFCACA
      CAFFC8C8C8FFC0C0C0FF9C9C9CFF868686FF9E9E9EFFB7B7B7FF7B7B7BFF0000
      00B3000000830000003C0000000C000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A3FFA6A6A6FFABABABFFB3B3B3FFBDBDBDFFC3C3C3FFF9F9F9FFAAAAAAFFC4C4
      C4FFC0C0C0FFBABABAFFB6B6B6FF989898FF868686FF9D9D9DFFB7B7B7FF7B7B
      7BFF000000B3000000830000003C0000000C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B8B
      8BFFA3A3A3FFA5A5A5FFAAAAAAFFB1B1B1FFBBBBBBFFC3C3C3FFF9F9F9FFA9A9
      A9FFC0C0C0FFBBBBBBFFB6B6B6FFB3B3B3FF969696FF848484FF9F9F9FFFB8B8
      B8FF7B7B7BFF000000B3000000830000003C0000000C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000007979
      79FF8C8C8CFFA6A6A6FFA9A9A9FFACACACFFB2B2B2FFBCBCBCFFC5C5C5FFFAFA
      FAFFAAAAAAFFC3C3C3FFBABABAFFB4B4B4FFB0B0B0FF949494FF858585FFA0A0
      A0FFB9B9B9FF7B7B7BFF000000B3000000830000003C0000000C000000000000
      000000000000000000000000000000000000000000000000000000000000AAAA
      AAFF7B7B7BFF929292FFAFAFAFFFB3B3B3FFB2B2B2FFB6B6B6FFBCBCBCFFC4C4
      C4FFFDFDFDFFADADADFFC2C2C2FFB9B9B9FFB2B2B2FFAFAFAFFF939393FF8787
      87FFA3A3A3FFB9B9B9FF7B7B7BFF000000B4000000840000003E0000000C0000
      000000000000000000000000000000000000000000000000000000000000BABA
      BAFFAFAFAFFF818181FF9D9D9DFFBEBEBEFFBEBEBEFFB8B8B8FFB5B5B5FFBABA
      BAFFC3C3C3FFFBFBFBFFACACACFFC2C2C2FFB9B9B9FFB3B3B3FFAFAFAFFF9494
      94FF8A8A8AFFA5A5A5FFBBBBBBFF7B7B7BFF000000B6000000860000003E0000
      000C00000000000000000000000000000000000000000000000000000000D2D2
      D2FFBFBFBFFFB6B6B6FF898989FFA9A9A9FFCACACAFFC2C2C2FFBABABAFFB4B4
      B4FFB6B6B6FFC1C1C1FFFBFBFBFFADADADFFC2C2C2FFB8B8B8FFB2B2B2FFB6B6
      B6FF9E9E9EFF929292FFA8A8A8FFBCBCBCFF7B7B7BFF000000B7000000850000
      003D0000000C000000000000000000000000000000000000000000000000DFDF
      DFFFD3D3D3FFC1C1C1FFBDBDBDFF929292FFB1B1B1FFCECECEFFC5C5C5FFBDBD
      BDFFBABABAFFBABABAFFC5C5C5FFFEFEFEFFAAAAAAFFBABABAFFB4B4B4FFBFBF
      BFFFCACACAFFADADADFF9A9A9AFFAAAAAAFFB8B8B8FF787878FF000000B60000
      007900000024000000000000000000000000000000000000000000000000D8D8
      D8FFD8D8D8FFCFCFCFFFC4C4C4FFC5C5C5FF999999FFB2B2B2FFCBCBCBFFC5C5
      C5FFC1C1C1FFC0C0C0FFC6C6C6FFAAAAAAFF8E8E8EFFB4B4B4FFB3B3B3FFC1C1
      C1FFD4D4D4FFD6D6D6FFFAFAFAFFB9B9B9FFC3C3C3FFC6C6C6FF686868FF0000
      009100000030000000000000000000000000000000000000000000000000FFFF
      FFFFD4D4D4FFD2D2D2FFCCCCCCFFC6C6C6FFCACACAFF989898FFAEAEAEFFCACA
      CAFFC9C9C9FFC9C9C9FFAFAFAFFF959595FFBABABAFFB0B0B0FFB1B1B1FFC4C4
      C4FFD5D5D5FFFFFFFFFFB8B8B8FFBBBBBBFFC1C1C1FFBFBFBFFF636363FF0000
      009100000030000000000000000000000000000000000000000000000000ECEC
      ECFFFFFFFFFFCECECEFFCBCBCBFFC3C3C3FFC0C0C0FFC6C6C6FF979797FFB0B0
      B0FFCFCFCFFFB2B2B2FF9C9C9CFFCDCDCDFFBEBEBEFFB5B5B5FFB9B9B9FFC9C9
      C9FFF6F6F6FFB2B2B2FFB4B4B4FFA9A9A9FFACACACFFBDBDBDFF646464FF0000
      009000000030000000000000000000000000000000000000000000000000DADA
      DAFFE9E9E9FFF8F8F8FFC8C8C8FFC3C3C3FFBCBCBCFFBBBBBBFFC9C9C9FF9C9C
      9CFFB9B9B9FF9F9F9FFFD6D6D6FFCDCDCDFFC3C3C3FFC0C0C0FFC8C8C8FFF2F2
      F2FFCBCBCBFFAFAFAFFFA4A4A4FFFFFFFFFFFFFFFFFFA7A7A7FF636363FF0000
      009B000000480000000C0000000000000000000000000000000000000000D0D0
      D0FFD9D9D9FFE5E5E5FFF4F4F4FFC2C2C2FFBCBCBCFFB6B6B6FFBCBCBCFFCDCD
      CDFF9F9F9FFFD5D5D5FFCECECEFFC6C6C6FFC4C4C4FFC6C6C6FFF2F2F2FFCACA
      CAFFAAAAAAFFA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFF0000
      00B3000000830000003C0000000C00000000000000000000000000000000A3A3
      A3FFCECECEFFD7D7D7FFE2E2E2FFEEEEEEFFBDBDBDFFB8B8B8FFB5B5B5FFBCBC
      BCFFC3C3C3FFC3C3C3FFBFBFBFFFBFBFBFFFC4C4C4FFEDEDEDFFC9C9C9FFA4A4
      A4FF979797FFFFFFFFFFFFFFFFFFFFFFFFFF7E7E7EFFFFFFFFFFFFFFFFFF9595
      95FF000000B3000000830000003C0000000C0000000000000000000000000000
      0000A3A3A3FFCDCDCDFFD7D7D7FFE1E1E1FFEFEFEFFFBDBDBDFFB9B9B9FFB6B6
      B6FFB7B7B7FFB7B7B7FFB9B9B9FFBFBFBFFFEFEFEFFFC8C8C8FF9E9E9EFF8D8D
      8DFFEFEFEFFFF8F8F8FFFAFAFAFF757575FF767676FF777777FFFDFDFDFFF7F7
      F7FF909090FF000000B3000000830000003C0000000C00000000000000000000
      000000000000A3A3A3FFCFCFCFFFD9D9D9FFE6E6E6FFFBFBFBFFC7C7C7FFC0C0
      C0FFBBBBBBFFBBBBBBFFBEBEBEFFEAEAEAFFC7C7C7FF9E9E9EFF868686FFDBDB
      DBFFE3E3E3FFECECECFFB9B9B9FF707070FF717171FF727272FFC0C0C0FFFAFA
      FAFFF2F2F2FF8C8C8CFF000000B3000000830000003C0000000C000000000000
      00000000000000000000A4A4A4FFD2D2D2FFDEDEDEFFEBEBEBFFFFFFFFFFD0D0
      D0FFCCCCCCFFCACACAFFF1F1F1FFE7E7E7FF9B9B9BFF858585FFD3D3D3FFD5D5
      D5FFDADADAFFE0E0E0FFE5E5E5FFB2B2B2FF6C6C6CFFB6B6B6FFF4F4F4FFFDFD
      FDFFF6F6F6FFEAEAEAFF898989FF000000B3000000830000003C0000000C0000
      0000000000000000000000000000A6A6A6FFD5D5D5FFDFDFDFFFECECECFFFFFF
      FFFFDDDDDDFFFFFFFFFFE9E9E9FF9B9B9BFF888888FFD8D8D8FFD7D7D7FFD8D8
      D8FFDBDBDBFFDCDCDCFFDDDDDDFFDDDDDDFFABABABFFE1E1E1FFEBEBEBFFF9F9
      F9FFF6F6F6FF6C6C6CFFF2F2F2FF858585FF000000B3000000830000003C0000
      000000000000000000000000000000000000A8A8A8FFD9D9D9FFE1E1E1FFF7F7
      F7FFFFFFFFFFF6F6F6FFA3A3A3FF8F8F8FFFE6E6E6FFE8E8E8FFECECECFFB9B9
      B9FFF4F4F4FFF2F2F2FFEDEDEDFFE6E6E6FFDEDEDEFFDBDBDBFFE0E0E0FFF0F0
      F0FF6F6F6FFFFBFBFBFF565656FFE9E9E9FF828282FF000000A7000000600000
      00000000000000000000000000000000000000000000A9A9A9FFDADADAFFE9E9
      E9FFEBEBEBFFEEEEEEFF979797FFF6F6F6FFFFFFFFFFFFFFFFFF7F7F7FFF8080
      80FFD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFDFDFDFFFDBDBDBFF6B6B
      6BFFFBFBFBFF575757FF555555FF525252FFE3E3E3FF808080FF0000003C0000
      0000000000000000000000000000000000000000000000000000A9A9A9FFE0E0
      E0FFE7E7E7FFEBEBEBFF989898FFFFFFFFFFFFFFFFFF8A8A8AFF8E8E8EFF8C8C
      8CFF888888FFDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FF656565FFF3F3
      F3FF565656FF555555FF535353FFE4E4E4FF808080FF0000003C0000000C0000
      000000000000000000000000000000000000000000000000000000000000ACAC
      ACFFD9D9D9FFDFDFDFFFE1E1E1FFA1A1A1FFFFFFFFFFFFFFFFFF939393FF9393
      93FFF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF717171FFF1F1F1FF5555
      55FF545454FF535353FFE4E4E4FF808080FF0000003C0000000C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ABABABFFAEAEAEFFB2B2B2FFC0C0C0FFACACACFFFFFFFFFFFFFFFFFFF9F9
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF818181FFFFFFFFFF565656FF5454
      54FF525252FFE4E4E4FF808080FF0000003C0000000C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADADFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8C8CFFFFFFFFFF5D5D5DFF555555FF5252
      52FFE3E3E3FF808080FF0000003C0000000C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B8FFFFFF
      FFFFFFFFFFFFFFFFFFFF989898FFFFFFFFFF606060FF565656FF525252FFE3E3
      E3FF808080FF0000003C0000000C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C7C7
      C7FFFFFFFFFF9B9B9BFFFFFFFFFF6A6A6AFF585858FF525252FFE2E2E2FF8080
      80FF0000003C0000000C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4C4C4FFFFFFFFFF717171FF5E5E5EFF525252FFE1E1E1FF808080FF0000
      003C0000000C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0A0A0FFFFFFFFFF535353FFE0E0E0FF7F7F7FFF0000003C0000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000818181FFE1E1E1FF7F7F7FFF0000003C0000000C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7FFF000000180000000C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      FFFF0000FFFF00007FFF00003FFF00001FFF00000FFF000007FF000003FF0000
      01FF000000FF000000FF000000FF000000FF000000FF0000007F8000003FC000
      001FE000000FF0000007F8000003FC000001FE000003FF000007FF80000FFFFC
      001FFFFE003FFFFF007FFFFF80FFFFFFC1FFFFFFE3FFFFFFF7FFFFFFFFFF}
    PopupMenu = PopupMenu
    Visible = True
    OnMouseDown = TrayIconMouseDown
    Left = 56
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 120
    object MenuItemDevider: TMenuItem
      Caption = '-'
      OnClick = MenuClick
    end
    object MenuItemDisplayHide: TMenuItem
      Caption = '&Show'
      OnClick = MenuClick
    end
    object MenuItemRefresh: TMenuItem
      Caption = '&Refresh'
      OnClick = MenuClick
    end
    object MenuItemExit: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = 'E&xit'
      OnClick = MenuClick
    end
  end
end
