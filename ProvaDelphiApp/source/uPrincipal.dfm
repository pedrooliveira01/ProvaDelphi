object ufPrincipal: TufPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 582
  ClientWidth = 1020
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 312
    Top = 152
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object menutarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = menutarefa1Click
      end
      object menutarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = menutarefa2Click
      end
      object menutarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = menutarefa3Click
      end
    end
  end
end
