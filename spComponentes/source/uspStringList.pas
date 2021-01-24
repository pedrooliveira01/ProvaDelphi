unit uspStringList;

interface

uses System.Classes;

type
  TspStringList = class(TStringList)
  private
    FmaxLines: Integer;
    FerrorExceptionMaxLines: String;
  public
    function Add(const S: string): Integer; override;
    constructor Create;
  published
    property maxLines: Integer read FmaxLines write FmaxLines;
    property errorExceptionMaxLines: String read FerrorExceptionMaxLines write FerrorExceptionMaxLines;
  end;


implementation

uses
  System.SysUtils;

{ TspStringList }

function TspStringList.Add(const S: string): Integer;
begin
  if (maxLines>0) and (Count >= maxLines ) then
     if (errorExceptionMaxLines<>'') then
        raise Exception.Create(errorExceptionMaxLines) else
        raise Exception.Create('Numero de itens maior que o definido.');

  result := inherited Add(S);
end;

constructor TspStringList.Create;
begin
  inherited;
  maxLines := 0;
end;

end.
