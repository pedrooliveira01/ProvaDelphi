unit uspQuery;

interface

uses FireDAC.Comp.Client, FireDAC.Stan.Param, System.Classes;

type TspQuery = class(TFDQuery)
   private
    FspCondicoes: TStrings;
    FspColunas: TStrings;
    FspTabelas: TStrings;
    procedure SetspColunas(const Value: TStrings);
    procedure SetspCondicoes(const Value: TStrings);
    procedure SetspTabelas(const Value: TStrings);
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     procedure GeraSQL;
     procedure Clear;

   published
     property spCondicoes: TStrings read FspCondicoes write SetspCondicoes;
     property spColunas: TStrings read FspColunas write SetspColunas;
     property spTabelas: TStrings read FspTabelas write SetspTabelas;

end;

implementation

uses
  System.SysUtils, uspStringList;

{ TspQuery }

procedure TspQuery.Clear;
begin
  FspCondicoes.Clear;
  FspColunas.Clear;
  FspTabelas.Clear;
  SQl.Clear;
end;

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FspCondicoes := TspStringList.Create;
  FspColunas := TspStringList.Create;
  FspTabelas := TspStringList.Create;

  TspStringList(FspTabelas).maxLines := 1; // Permitir somente 1 tabela
  TspStringList(FspTabelas).errorExceptionMaxLines := 'É permitido apenas 1 tabela'; // Erro caso der exception maxLines
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.free;
  FspColunas.free;
  FspTabelas.free;
  inherited;
end;

procedure TspQuery.GeraSQL;
var i:integer;
    aStrBuilder : TStringBuilder;
begin
  if (FspTabelas.count=0) then
    raise Exception.Create('Não foi possivel gerar SQL, é necessario informar a tabela.');

  aStrBuilder := TStringBuilder.Create;
  aStrBuilder.Append('SELECT ');

  if (FspColunas.count=0) then
     aStrBuilder.Append('*') else
  Begin
    for I := 0 to FspColunas.count-1 do
    Begin
      if i>0 then
         aStrBuilder.Append(', ');
      aStrBuilder.Append(FspColunas[i]);
    End;
  End;

  aStrBuilder.Append(' FROM ').Append(FspTabelas[0]);

  if FspCondicoes.count > 0 then
  Begin
    aStrBuilder.Append(' WHERE ');
    for I := 0 to FspCondicoes.count-1 do
    Begin
      if i>0 then
         aStrBuilder.Append(' ');
      aStrBuilder.Append(FspCondicoes[i]);
    End;
  End;

  SQL.text := aStrBuilder.ToString();
  aStrBuilder.free;

end;

procedure TspQuery.SetspColunas(const Value: TStrings);
begin
  FspColunas.Assign(Value);
end;

procedure TspQuery.SetspCondicoes(const Value: TStrings);
begin
  FspCondicoes.Assign(Value);
end;

procedure TspQuery.SetspTabelas(const Value: TStrings);
begin
  if (Value.Count > 1) then
    raise Exception.Create('É permitido apenas 1 tabela');

  FspTabelas.Assign(Value);
end;

end.
