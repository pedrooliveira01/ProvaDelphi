inherited ufTarefa3: TufTarefa3
  Caption = 'Tarefa 3'
  ClientHeight = 461
  ClientWidth = 704
  Visible = True
  OnDestroy = FormDestroy
  ExplicitWidth = 720
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object lblTituloGrid: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 13
    Caption = 'Valores por projeto'
  end
  object lblTotal: TLabel
    Left = 575
    Top = 335
    Width = 44
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Total R$:'
  end
  object lblTotalDivisoes: TLabel
    Left = 575
    Top = 382
    Width = 85
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Total divis'#245'es R$:'
  end
  object DBG: TDBGrid
    Left = 8
    Top = 27
    Width = 688
    Height = 302
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProjeto'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        Width = 466
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end>
  end
  object btnObterTotal: TButton
    Left = 494
    Top = 352
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnObterTotalClick
  end
  object btnObterTotalDivisoes: TButton
    Left = 456
    Top = 399
    Width = 113
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 2
    OnClick = btnObterTotalDivisoesClick
  end
  object edtTotal: TEdit
    Left = 575
    Top = 354
    Width = 121
    Height = 21
    Anchors = [akRight, akBottom]
    ReadOnly = True
    TabOrder = 3
  end
  object edtTotalDivisoes: TEdit
    Left = 575
    Top = 401
    Width = 121
    Height = 21
    Anchors = [akRight, akBottom]
    ReadOnly = True
    TabOrder = 4
  end
  object DataSource1: TDataSource
    Left = 344
    Top = 240
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 288
  end
end
