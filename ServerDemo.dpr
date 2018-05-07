{ Copyright (C) 2017 ZZZ Ltd. - Bulgaria. All rights reserved. }
program ServerDemo;

uses
  Forms,
  ZZZServerDemo in 'ZZZServerDemo.pas' {MainForm},
  UZZZClient in 'UZZZClient.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
