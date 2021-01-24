program ProvaDelpheAppTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  uTestfTarefa1 in 'source\uTestfTarefa1.pas',
  uTestfTarefa2 in 'source\uTestfTarefa2.pas',
  uMdiForm in '..\source\uMdiForm.pas' {ufMdiForm},
  uPrincipal in '..\source\uPrincipal.pas' {ufPrincipal},
  uProjetosData in '..\source\uProjetosData.pas',
  uTarefa1 in '..\source\uTarefa1.pas' {ufTarefa1},
  uTarefa2 in '..\source\uTarefa2.pas' {ufTarefa2},
  uTarefa3 in '..\source\uTarefa3.pas' {ufTarefa3},
  uThreadProgress in '..\source\uThreadProgress.pas',
  uTestfTarefa3 in 'source\uTestfTarefa3.pas',
  uTestFPrincipal in 'source\uTestFPrincipal.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
