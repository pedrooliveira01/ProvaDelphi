unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TufPrincipal = class(TForm)
    MainMenu: TMainMenu;
    arefas1: TMenuItem;
    menutarefa1: TMenuItem;
    menutarefa2: TMenuItem;
    menutarefa3: TMenuItem;
    procedure menutarefa1Click(Sender: TObject);
    procedure menutarefa2Click(Sender: TObject);
    procedure menutarefa3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function CriarForm(pFormulario: TFormClass; AOwner: TForm): TForm;
  end;

var
  ufPrincipal: TufPrincipal;

implementation

{$R *.dfm}

uses uTarefa1, uTarefa2, uTarefa3;

procedure TufPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  for I := 0 to MDIChildCount-1 do
     MDIChildren[i].close;
end;

procedure TufPrincipal.menutarefa1Click(Sender: TObject);
begin
  CriarForm(TufTarefa1, self );
end;

procedure TufPrincipal.menutarefa2Click(Sender: TObject);
begin
  CriarForm(TufTarefa2, self);
end;

procedure TufPrincipal.menutarefa3Click(Sender: TObject);
begin
  CriarForm(TufTarefa3, self);
end;

function TufPrincipal.CriarForm(pFormulario: TFormClass; AOwner: TForm): TForm;
begin
  Result := pFormulario.Create(AOwner);
  Result.Show;
end;

end.
