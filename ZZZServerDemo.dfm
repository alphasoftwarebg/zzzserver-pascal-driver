object MainForm: TMainForm
  Left = 400
  Top = 137
  Width = 544
  Height = 551
  Caption = 'ZZZServer Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100001000400280100001600000028000000100000002000
    0000010004000000000000000000000000000000000000000000000000000000
    0000241CED00CC483F00277FFF000EC9FF0000F2FF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000004441
    0000000003444415222222223444444100000000034444444444444444444444
    4344444444444444330444444444444440204444444444444402044444444444
    4440204444444444444402044444444444444051444444444444441144444444
    4444444444444441000000000344441522222222344444410000000003440000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object HostLabel: TLabel
    Left = 8
    Top = 9
    Width = 25
    Height = 13
    Caption = 'Host:'
  end
  object PortLabel: TLabel
    Left = 208
    Top = 9
    Width = 22
    Height = 13
    Caption = 'Port:'
  end
  object RunButton: TButton
    Left = 445
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Run'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = RunButtonClick
  end
  object ProgramRichEdit: TRichEdit
    Left = 8
    Top = 32
    Width = 513
    Height = 233
    Hint = 'A ZZZServer program'
    Lines.Strings = (
      '#[#;'
      #9#9'Comment.'
      ']'
      '#[.=;i;01]'
      '#[cout;'
      #9'#[{ .? };'
      #9#9'['
      #9#9#9'##[i]. Hello World from ZZZ Server!##[chr;10]'
      #9#9#9'#[.=;i;#[fmtl;%02lld;#[+;1;##[i]]]]'
      #9#9'];'
      #9#9'['
      #9#9#9'#[>=n;5;##[i];[true];[false]]'
      #9#9']'
      #9']'
      ']')
    ParentShowHint = False
    PlainText = True
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 1
    WordWrap = False
  end
  object ResultRichEdit: TRichEdit
    Left = 8
    Top = 272
    Width = 513
    Height = 233
    Hint = 'The result'
    ParentShowHint = False
    PlainText = True
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 2
    WordWrap = False
  end
  object HostEdit: TEdit
    Left = 40
    Top = 6
    Width = 160
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'localhost'
  end
  object PortEdit: TEdit
    Left = 240
    Top = 6
    Width = 49
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = '3333'
  end
end
