{ Copyright (C) 2017 ZZZ Ltd. - Bulgaria. All rights reserved. }
unit ZZZServerDemo;

interface

uses
  Classes, ComCtrls, Controls, Forms, StdCtrls, SysUtils,
  UZZZClient;

type
  TMainForm = class(TForm)
    RunButton: TButton;
    ProgramRichEdit: TRichEdit;
    ResultRichEdit: TRichEdit;
    HostEdit: TEdit;
    HostLabel: TLabel;
    PortLabel: TLabel;
    PortEdit: TEdit;
    procedure RunButtonClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;


implementation

{$R *.DFM}


procedure TMainForm.RunButtonClick(Sender: TObject);
var
  zzzClient: TZZZClient;
  zzzServerProgram: String;
  zzzServerResult: String;
  startTime: TDateTime;

begin
  zzzClient := TZZZClient.Create;
  try
    zzzServerProgram := StringReplace(ProgramRichEdit.Lines.Text, #13, '',
      [rfReplaceAll]) + #0;
    ResultRichEdit.Lines.Clear;

    startTime := Now;
    zzzServerResult := StringReplace(zzzClient.ZZZProgram(HostEdit.Text,
      StrToInt(PortEdit.Text), zzzServerProgram), #0, '', [rfReplaceAll]);
    ResultRichEdit.Lines.Add(zzzServerResult);
    ResultRichEdit.Lines.Add('Time: ' + FormatDateTime('ss.zzz', Now - startTime)
      + ' seconds.' + #10);
  finally
    zzzClient.Destroy;
  end;
end;


end.
