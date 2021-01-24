unit uspComponentesRegistro;

interface

procedure Register;

implementation

uses uspQuery, System.Classes;

procedure Register;
begin
  RegisterComponents('spComponents', [TspQuery]);
end;

end.
