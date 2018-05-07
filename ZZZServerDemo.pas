{
	ZZZServerDemo.pas

	Copyright 2017 ZZZ Ltd. - Bulgaria

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
}
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
