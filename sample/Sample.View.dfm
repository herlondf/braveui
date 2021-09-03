object frmSample: TfrmSample
  Left = 0
  Top = 0
  Caption = 'frmSample'
  ClientHeight = 465
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GridView1: TGridView
    Left = 0
    Top = 0
    Width = 723
    Height = 361
    Align = alTop
    CheckBoxes = True
    CheckStyle = csFlat
    Columns = <
      item
        Caption = 'Share Name'
        DefWidth = 100
      end
      item
        Caption = 'Folder Path'
        DefWidth = 150
      end
      item
        Caption = 'File Description'
        DefWidth = 250
      end
      item
        Caption = 'Enabled'
        CheckKind = gcCheckBox
        ReadOnly = True
        DefWidth = 100
      end>
    Rows.Count = 7
    ShowCellTips = False
    TabOrder = 0
  end
end
