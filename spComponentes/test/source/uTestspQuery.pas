unit uTestspQuery;

interface
uses
  DUnitX.TestFramework, uspQuery, FireDAC.DApt, FireDAC.Phys.SQLiteDef, FireDAC.Phys, FireDAC.Phys.SQLite;

type

  [TestFixture]
  TTestspQuery = class(TObject)
  private
    FspQuery : TspQuery;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure GeraSQL;
    [Test]
    procedure GeraSQL_semColunas;
    [Test]
    procedure GeraSQL_semColunas_semCondicoes;
    [Test]
    procedure GeraSQL_semColunas_semCondicoes_semTabela;
    [Test]
    procedure ExceptionspTabelas;
    [Test]
    procedure Clear;
    [Test]
    procedure SetProperties;
  end;

implementation

uses
  System.SysUtils, System.Classes, uspStringList;

procedure TTestspQuery.GeraSQL;
  procedure AddSelect;
  Begin
    FspQuery.Clear;
    FspQuery.spColunas.Add('Field1');
    FspQuery.spColunas.Add('Field2');
    FspQuery.spTabelas.Add('Tabela');
    FspQuery.spCondicoes.Add('Field1=1');
    FspQuery.spCondicoes.Add('and Field2=2');
  End;
  var aResult : String;
begin
  aResult :=  'SELECT Field1, Field2 FROM Tabela WHERE Field1=1 and Field2=2';
  AddSelect;
  FspQuery.GeraSQL;

  Assert.IsTrue(FspQuery.SQL.text = aResult, 'Esperado: ['+ aResult +']' + ' Gerado: ['+ FspQuery.sql.text +']');
end;

procedure TTestspQuery.GeraSQL_semColunas;
  procedure AddSelect;
  Begin
    FspQuery.Clear;
    FspQuery.spTabelas.Add('Tabela');
    FspQuery.spCondicoes.Add('Field1=1');
  End;
  var aResult : String;
begin
  aResult :=  'SELECT * FROM Tabela WHERE Field1=1';
  AddSelect;
  FspQuery.GeraSQL;

  Assert.IsTrue(FspQuery.SQL.text = aResult, 'Esperado: ['+ aResult +']' + ' Gerado: ['+ FspQuery.sql.text +']');
end;

procedure TTestspQuery.GeraSQL_semColunas_semCondicoes;
  procedure AddSelect;
  Begin
    FspQuery.Clear;
    FspQuery.spTabelas.Add('Tabela');
  End;
  var aResult : String;
begin
  aResult :=  'SELECT * FROM Tabela';
  AddSelect;
  FspQuery.GeraSQL;

  Assert.IsTrue(FspQuery.SQL.text = aResult, 'Esperado: ['+ aResult +']' + ' Gerado: ['+ FspQuery.sql.text +']');
end;

procedure TTestspQuery.GeraSQL_semColunas_semCondicoes_semTabela;
begin
  FspQuery.Clear;

  Assert.WillRaise(procedure begin
      FspQuery.GeraSQL
    end, nil, 'Não gerou exception, informar no minimo a tabela');


  Assert.IsTrue(FspQuery.SQL.text = '', 'Esperado: []' + ' Gerado: ['+ FspQuery.sql.text +']');

end;

procedure TTestspQuery.Clear;
begin
  FspQuery.Clear;
  Assert.IsTrue(FspQuery.spCondicoes.text = '', 'Esperado Condições: []' + ' Gerado: ['+ FspQuery.spCondicoes.text +']');
  Assert.IsTrue(FspQuery.spColunas.text = '', 'Esperado Colunas: []' + ' Gerado: ['+ FspQuery.spColunas.text +']');
  Assert.IsTrue(FspQuery.spTabelas.text = '', 'Esperado Tabelas: []' + ' Gerado: ['+ FspQuery.spTabelas.text +']');
  Assert.IsTrue(FspQuery.SQL.text = '', 'Esperado: []' + ' Gerado: ['+ FspQuery.sql.text +']');
end;

procedure TTestspQuery.ExceptionspTabelas;
var aStringList : TStringList;
begin
  Assert.WillRaise(procedure begin
    FspQuery.spTabelas.Clear;
    FspQuery.spTabelas.add('tabela1');
    FspQuery.spTabelas.add('tabela2');
  end,nil,'Não gerou exception, mais de 1 tabela.');

  aStringList := TStringList.Create;
  aStringList.add('tabela1');
  aStringList.add('tabela2');
  Assert.WillRaise(procedure begin
    FspQuery.spTabelas.Clear;
    FspQuery.spTabelas := aStringList;
  end,nil,'Não gerou exception, mais de 1 tabela.');
  aStringList.free;

  TspStringList(FspQuery.spTabelas).errorExceptionMaxLines := '';// Caso nao tiver preenchido trazer erro exception do comp.
  Assert.WillRaise(procedure begin
    FspQuery.spTabelas.Clear;
    FspQuery.spTabelas.add('tabela1');
    FspQuery.spTabelas.add('tabela2');
  end,nil,'Não gerou exception, mais de 1 tabela.');
end;

procedure TTestspQuery.SetProperties;
var aStringList : TStringList;
begin
  FspQuery.Clear;
  aStringList := TStringList.Create;
  aStringList.Add('teste');

  FspQuery.spCondicoes := aStringList;
  Assert.IsTrue(FspQuery.spCondicoes[0] = 'teste', 'Esperado Condições: [teste]' + ' Gerado: ['+ FspQuery.spCondicoes[0] +']');

  FspQuery.spTabelas := aStringList;
  Assert.IsTrue(FspQuery.spTabelas[0] = 'teste', 'Esperado Colunas: [teste]' + ' Gerado: ['+ FspQuery.spTabelas[0] +']');

  FspQuery.spColunas := aStringList;
  Assert.IsTrue(FspQuery.spColunas[0] = 'teste', 'Esperado Colunas: [teste]' + ' Gerado: ['+ FspQuery.spColunas[0] +']');

  aStringList.Free;
end;

procedure TTestspQuery.Setup;
begin
  FspQuery := TspQuery.Create(nil);
  TspStringList(FspQuery.spTabelas).maxLines := 1;
  TspStringList(FspQuery.spTabelas).errorExceptionMaxLines := 'Permitido apenas 1 tabela';
end;

procedure TTestspQuery.TearDown;
begin
  FspQuery.free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestspQuery);
end.
