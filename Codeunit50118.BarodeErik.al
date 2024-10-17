codeunit 50118 BarodeErik implements "Barcode Font Provider"
{
    procedure GetSupportedBarcodeSymbologies(var Result: List of [enum System.Text."Barcode Symbology"])
    begin

    end;

    procedure EncodeFont(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"): Text
    begin

    end;

    procedure EncodeFont(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"; BarcodeEncodeSettings: Record "Barcode Encode Settings"): Text
    begin

    end;

    procedure ValidateInput(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology")
    begin

    end;

    procedure ValidateInput(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"; BarcodeEncodeSettings: Record "Barcode Encode Settings")
    begin

    end;
}