enum 50101 Operation implements IMathe1, IMathe2
{
    Extensible = true;
    
    value(0; "Plus und Mal")
    {
        Caption = 'Plus und Mal';
        Implementation = IMathe1 = rechneplus, IMathe2 = rechnemal;
        
    }
    value(1; "Minus und Durch")
    {
        Caption = 'Minus und Durch';
        Implementation = IMathe1 = rechneminus, IMathe2 = rechnedurch;
    }
}
