inherited ufTarefa1: TufTarefa1
  Caption = 'Tarefa 1'
  ClientHeight = 461
  ClientWidth = 704
  Visible = True
  ExplicitWidth = 720
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 16
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 202
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 388
    Top = 13
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSQL: TLabel
    Left = 16
    Top = 229
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object memoColunas: TMemo
    Left = 16
    Top = 32
    Width = 180
    Height = 185
    TabOrder = 0
  end
  object memoTabelas: TMemo
    Left = 202
    Top = 32
    Width = 180
    Height = 185
    TabOrder = 1
  end
  object memoCondicoes: TMemo
    Left = 388
    Top = 32
    Width = 180
    Height = 185
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 574
    Top = 176
    Width = 122
    Height = 41
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object memoSQL: TMemo
    Left = 16
    Top = 248
    Width = 676
    Height = 204
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
end
