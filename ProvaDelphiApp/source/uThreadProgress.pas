unit uThreadProgress;

interface

uses
  System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TThreadProgress = class(TThread)
  private
    FParent : TWinControl;
    FSleepTime : Integer;
    FLabel : TLabel;
    FPB : TProgressBar;
    FPanel: TPanel;
    FId: Integer;
    FPosition: Integer;
    FMax: Integer;
    FFinalizado: Boolean;
    procedure CreateVisualComponents;
    procedure DestroyVisualComponents;
  protected
    procedure Execute; override;
  public
    property Id: Integer read FId write FId;
    property SleepTime: Integer read FSleepTime write FSleepTime;
    property Position: Integer read FPosition write FPosition;
    property Max: Integer read FMax write FMax;
    property Finalizado: Boolean read FFinalizado write FFinalizado;
    constructor Create(pParent : TWinControl); reintroduce;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ uThreadProgress }

constructor TThreadProgress.Create(pParent : TWinControl);
begin
  inherited Create(True);
  FParent := pParent;
  Synchronize(self, CreateVisualComponents);
  FPosition := 0;
  FMax := 100;
  FFinalizado := False;
end;

procedure TThreadProgress.CreateVisualComponents;
begin
  FPanel := TPanel.Create(FParent);
  FPanel.Parent := FParent;
  FPanel.Align := alTop;
  FPanel.Caption := '';
  FPanel.AlignWithMargins := True;
  FPanel.Height := 60;

  FPB := TProgressBar.Create(FPanel);
  FPB.Parent := FPanel;
  FPB.Position := 0;
  FPB.Max := FMax;
  FPB.Step := 1;
  FPB.Align := alTop;
  FPB.AlignWithMargins := True;

  FLabel := TLabel.Create(FPanel);
  FLabel.Parent := FPanel;
  FLabel.Align := alTop;
  FLabel.AlignWithMargins := True;
  FLabel.Caption := 'Thread '+FId.ToString+' [Progresso: %s]';
end;

destructor TThreadProgress.Destroy;
begin
  inherited Destroy;
end;

procedure TThreadProgress.DestroyVisualComponents;
begin
  if Assigned(FLabel) then
    FreeAndNil(FLabel);

  if Assigned(FPB) then
    FreeAndNil(FPB);

  if Assigned(FPanel) then
    FreeAndNil(FPanel);
end;

procedure TThreadProgress.Execute;
var aCaption : String;
begin
  try
    aCaption := 'Thread '+FId.ToString+' [Progresso: %s] [Sleep: '+ FSleepTime.ToString +']';
    FPosition := 0;
    FPB.Position := FPosition;
    FPB.Max := FMax;

    while (not FFinalizado) and (not terminated) and (FPB.Position<FPB.Max) do
    Begin
      inc(FPosition);
      FPB.Position := FPosition;
      FLabel.Caption := format(aCaption,[FPB.Position.ToString]);
      sleep(FSleepTime);
    end;
  finally
    if Assigned(FParent) then
      Synchronize(self, DestroyVisualComponents) else
      DestroyVisualComponents;
    Terminate;
    FFinalizado := true;
  end;
end;


end.
