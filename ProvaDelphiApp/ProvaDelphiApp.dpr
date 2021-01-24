program ProvaDelphiApp;

uses
  Vcl.Forms,
  uPrincipal in 'source\uPrincipal.pas' {ufPrincipal},
  uTarefa1 in 'source\uTarefa1.pas' {ufTarefa1},
  uTarefa2 in 'source\uTarefa2.pas' {ufTarefa2},
  uTarefa3 in 'source\uTarefa3.pas' {ufTarefa3},
  uMdiForm in 'source\uMdiForm.pas' {ufMdiForm},
  uThreadProgress in 'source\uThreadProgress.pas',
  uProjetosData in 'source\uProjetosData.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TufPrincipal, ufPrincipal);
  Application.Run;
end.
