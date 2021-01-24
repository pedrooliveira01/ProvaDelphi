inherited ufTarefa2: TufTarefa2
  Caption = 'Tarefa 2'
  ClientHeight = 479
  ClientWidth = 704
  Visible = True
  OnDestroy = FormDestroy
  ExplicitWidth = 720
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  object lblSleepThread1: TLabel
    Left = 8
    Top = 3
    Width = 70
    Height = 13
    Caption = 'Sleep thread 1'
  end
  object lblSleepThread2: TLabel
    Left = 104
    Top = 2
    Width = 70
    Height = 13
    Caption = 'Sleep thread 2'
  end
  object btnCreateThread: TButton
    Left = 200
    Top = 19
    Width = 89
    Height = 25
    Caption = 'Criar Thread'
    TabOrder = 2
    OnClick = btnCreateThreadClick
  end
  object sbProgress: TScrollBox
    Left = 0
    Top = 55
    Width = 704
    Height = 405
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 3
  end
  object edtSleepThread1: TSpinEdit
    Left = 8
    Top = 22
    Width = 91
    Height = 22
    MaxValue = 3000
    MinValue = 1
    TabOrder = 0
    Value = 50
  end
  object edtSleepThread2: TSpinEdit
    Left = 104
    Top = 21
    Width = 91
    Height = 22
    MaxValue = 3000
    MinValue = 1
    TabOrder = 1
    Value = 100
  end
  object SB: TStatusBar
    Left = 0
    Top = 460
    Width = 704
    Height = 19
    Panels = <
      item
        Text = 'Total threads'
        Width = 90
      end
      item
        Width = 90
      end
      item
        Text = 'Total rodando'
        Width = 90
      end
      item
        Width = 90
      end>
  end
  object Timer: TTimer
    Interval = 100
    OnTimer = TimerTimer
    Left = 344
    Top = 248
  end
end
