unit uTestfTarefa2;

interface
uses
  DUnitX.TestFramework, Vcl.Forms, uTarefa2, uThreadProgress;

type

  [TestFixture]
  TTestfTarefa2 = class(TObject)
  private
    FTestTarefa2 : TufTarefa2;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('Teste thread 1','4,6')]
    function CreateProgressThread(pId:Integer; pSleepTime:Integer):TThreadProgress;
    [Test]
    procedure TestButtons;

  end;

implementation

uses
  System.Classes, System.SysUtils;

function TTestfTarefa2.CreateProgressThread(pId:Integer; pSleepTime:Integer): TThreadProgress;
var aResultID, aResultSleepTime : Integer;
    aResultSuspended, aAssigned : Boolean;
begin
  Result := FTestTarefa2.CreateProgressThread(pId, pSleepTime, nil);
  aAssigned := Assigned(Result);
  Assert.IsTrue(aAssigned,'Thread não foi criada.');

  aResultID := Result.Id;
  aResultSleepTime := Result.SleepTime;
  aResultSuspended := Result.Suspended;

  while not Result.Finalizado do
     sleep( Result.SleepTime );

  Assert.IsTrue(Result.Position = Result.Max,'Thread não concluida.');
  Assert.IsTrue((aResultID>0),'id Esperado: ['+ pId.ToString +']' + ' Gerado: ['+ aResultID.ToString +']');
  Assert.IsTrue((aResultSleepTime>0) ,'sleeptime Esperado: ['+ pSleepTime.ToString +']' + ' Gerado: ['+ aResultSleepTime.ToString +']');
  Assert.IsTrue((not aResultSuspended),'Thread não iniciada');
end;

procedure TTestfTarefa2.Setup;
begin
  FTestTarefa2 := TufTarefa2.Create(nil);
end;

procedure TTestfTarefa2.TearDown;
begin
  FTestTarefa2.free;
end;


procedure TTestfTarefa2.TestButtons;
begin
  FTestTarefa2.edtSleepThread1.Value := 4;
  FTestTarefa2.edtSleepThread1.Value := 6;
  FTestTarefa2.btnCreateThreadClick(nil);

  Assert.IsTrue((FTestTarefa2.FThreadList.Count = 2),'btnCreateThreadClick não gerou 2 threads');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestfTarefa2);
end.
