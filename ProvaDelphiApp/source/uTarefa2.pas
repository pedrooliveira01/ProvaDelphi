unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMdiForm, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin, System.Generics.Collections, uThreadProgress;

type
  TufTarefa2 = class(TufMdiForm)
    btnCreateThread: TButton;
    sbProgress: TScrollBox;
    lblSleepThread1: TLabel;
    edtSleepThread1: TSpinEdit;
    lblSleepThread2: TLabel;
    edtSleepThread2: TSpinEdit;
    SB: TStatusBar;
    Timer: TTimer;
    procedure btnCreateThreadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FThreadList : TObjectList<TThreadProgress>;
    function CreateProgressThread(pId:Integer; pSleepTime:Integer; pParent: TWinControl): TThreadProgress;
  end;

var
  ufTarefa2: TufTarefa2;

implementation

{$R *.dfm}

{ TufTarefa2 }

procedure TufTarefa2.btnCreateThreadClick(Sender: TObject);
begin
  inherited;
  if sbProgress.ControlCount >= 25 then
    raise Exception.Create('Permitido 25 threads simultaneas, aguarde.');
  CreateProgressThread(1, edtSleepThread1.value, sbProgress);
  CreateProgressThread(2, edtSleepThread2.value, sbProgress);
end;

function TufTarefa2.CreateProgressThread(pId:Integer; pSleepTime:Integer; pParent: TWinControl): TThreadProgress;
var aThread : TThreadProgress;
begin
  aThread := TThreadProgress.Create(pParent);
  aThread.SleepTime := pSleepTime;
  aThread.Id := pId;

  FThreadList.Add(aThread);

  aThread.Start;

  result := aThread;

end;

procedure TufTarefa2.FormCreate(Sender: TObject);
begin
  inherited;
  FThreadList := TObjectList<TThreadProgress>.Create(True);
end;

procedure TufTarefa2.FormDestroy(Sender: TObject);
var aThread : TThreadProgress;
begin
  for aThread in FThreadList do
  Begin
    if Assigned(aThread) and (not aThread.Finished) then
      aThread.Terminate;
  End;

  FThreadList.Free;
  inherited;
end;

procedure TufTarefa2.TimerTimer(Sender: TObject);
begin
  inherited;
  SB.Panels[1].Text := FThreadList.Count.ToString;
  SB.Panels[3].Text := sbProgress.ControlCount.ToString;
end;

end.
