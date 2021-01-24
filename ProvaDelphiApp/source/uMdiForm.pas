unit uMdiForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TufMdiForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ufMdiForm: TufMdiForm;

implementation

{$R *.dfm}

procedure TufMdiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TufMdiForm.FormCreate(Sender: TObject);
begin
  if Assigned(owner) and TForm(owner).active then
    FormStyle := fsMDIChild;
end;

end.
