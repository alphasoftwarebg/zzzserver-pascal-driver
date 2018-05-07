{ Copyright (C) 2017 ZZZ Ltd. - Bulgaria. All rights reserved. }
unit UZZZClient;

interface

uses
  SysUtils, Windows, WinSock;

type
  TZZZClient = class
  private
    { Private declarations }
    sock: TSocket;
    server: TSockAddr;
    function InitSocket: Integer;
    procedure UninitSocket;
  public
    { Public declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    function Connect(address: String; port: Integer): Boolean;
    procedure Close;
    function Send(data: String): Boolean;
    function Receive(): String;
    function ZZZProgram(host: String; port: Integer; data: String): String;
  end;


implementation

function TZZZClient.InitSocket: Integer;
var
  wsaData: TWSAData;

begin
  Result := 1;

  if ((WSAStartup(MAKEWORD(2, 2), wsaData) <> 0) and
     (WSAStartup(MAKEWORD(2, 1), wsaData) <> 0)) and
     (WSAStartup(MAKEWORD(1, 1), wsaData) <> 0)
  then
    Result := 0;
end;


procedure TZZZClient.UninitSocket;
begin
  WSACleanup;
end;


constructor TZZZClient.Create;
begin
  inherited;
  self.sock := -1;

  InitSocket;
end;


destructor TZZZClient.Destroy;
begin
  Close;

  UninitSocket;
end;


function TZZZClient.Connect(address: String; port: Integer): Boolean;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  he: PHostEnt;
  addr_list: PaPInAddr;

begin
    { create socket if it is not already created }
    if self.sock = -1 then
    begin
        { Create socket }
        self.sock := socket(AF_INET , SOCK_STREAM , 0);
        if self.sock = -1 then
        begin
            { Could not create socket }
        end
        { Socket created }
    end;
    { else OK , nothing }

    { setup address structure }
    if inet_addr(PChar(address)) = -1 then
    begin
      { resolve the hostname, its not an ip address }
      he := gethostbyname(PChar(address));
      if he = NIL then
      begin
        { Failed to resolve hostname }

        Result := FALSE;
        Exit;
      end;

      { Cast the h_addr_list to in_addr , since h_addr_list also has the ip
        address in long format only }
      addr_list := PaPInAddr(he.h_addr_list);

      server.sin_addr := addr_list^[0]^;
    end
    { plain ip address }
    else
        server.sin_addr.S_addr := inet_addr(PChar(address));

    server.sin_family := AF_INET;
    server.sin_port := htons(port);

    { Connect to remote server }
    if WinSock.connect(self.sock, server, SizeOf(server)) < 0 then
    begin
        { Error: Connect failed. }
        Result := FALSE;
        Exit;
    end;

    { Connected }
    Result := TRUE;
end;


procedure TZZZClient.Close;
begin
  if self.sock >= 0 then
  begin
    closesocket(self.sock);
    self.sock := -1;
  end;
end;


function TZZZClient.Send(data: String): Boolean;
begin
  Result := FALSE;

  { Send some data }
  if WinSock.send(self.sock, data[1], Length(data), 0) < 0 then
  begin
    { Send failed }
    Exit;
  end;
  // Data "data" send;
  Result := TRUE;
end;


function TZZZClient.Receive: String;
var
  buffer: array [0..512] of Char;
  len: Integer;

begin
  Result := '';

  { Receive a reply from the server }
  len := WinSock.recv(self.sock, buffer[0], Length(buffer)-1, 0);
  while len > 0 do
  begin
    buffer[len] := #0;
    Result := Result + StrPas(buffer);
    
    len := WinSock.recv(self.sock, buffer[0], Length(buffer)-1, 0);
  end;
end;


function TZZZClient.ZZZProgram(host: String; port: Integer; data: String): String;
begin
  Result := '';

  if Connect(host, port) then
  begin
    Send(data);
    result := Receive();
    Close();
  end;
end;


end.
