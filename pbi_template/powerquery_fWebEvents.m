
// Power Query M script to load fWebEvents.csv and basic transformations
let
    Source = Csv.Document(File.Contents("<<REPLACE_WITH_PATH>>\fWebEvents.csv"),[Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(Promoted, {
        {"EventID", Int64.Type},
        {"UserID", Int64.Type},
        {"SessionID", Int64.Type},
        {"EventName", type text},
        {"Timestamp", type datetime},
        {"DeviceType", type text},
        {"TrafficSource", type text}
    }),
    // Create FunnelStep numeric order (optional)
    AddFunnelStep = Table.AddColumn(ChangedType, "FunnelStep", each
        if [EventName]="Homepage" then 1
        else if [EventName]="ProductView" then 2
        else if [EventName]="AddToCart" then 3
        else if [EventName]="CheckoutStart" then 4
        else if [EventName]="Purchase" then 5
        else null, Int64.Type),
    // Trim text fields
    Trimmed = Table.TransformColumns(AddFunnelStep, {{"EventName", Text.Trim}, {"DeviceType", Text.Trim}, {"TrafficSource", Text.Trim}}),
    // Add Date parts
    AddDate = Table.AddColumn(Trimmed, "Date", each Date.From([Timestamp]), type date),
    AddYear = Table.AddColumn(AddDate, "Year", each Date.Year([Date]), Int64.Type)
in
    AddYear
