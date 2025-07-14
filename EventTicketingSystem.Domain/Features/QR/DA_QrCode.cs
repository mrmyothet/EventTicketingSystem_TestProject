namespace EventTicketingSystem.Domain.Features.QR;

public class DA_QrCode
{
    private readonly ILogger<DA_QrCode> _logger;
    private readonly AppDbContext _db;

    public DA_QrCode(ILogger<DA_QrCode> logger, AppDbContext db)
    {
        _logger = logger;
        _db = db;
    }

    public async Task<Result<QrGenerateResponseModel>> GenerateQr(QrGenerateRequestModel requestModel)
    {
        var response = new QrGenerateResponseModel();

        string ticketTypeCode = requestModel.TicketTypeCode;
        string ticketPriceCode = requestModel.TicketPriceCode;
        string ticketCode = requestModel.TicketCode;
        string eventCode = requestModel.EventCode;

        var tblTicketType = await _db.TblTickettypes.FirstOrDefaultAsync(x => x.Tickettypecode == ticketTypeCode && x.Deleteflag == false);
        var tblTicketPriceCode = await _db.TblTicketprices.FirstOrDefaultAsync(x => x.Ticketpricecode == ticketPriceCode && x.Deleteflag == false);
        var tblTicketCode = await _db.TblTickets.FirstOrDefaultAsync(x => x.Ticketcode == ticketCode && x.Deleteflag == false);
        var tblEvent = await _db.TblEvents.FirstOrDefaultAsync(x => x.Eventcode == eventCode && x.Deleteflag == false);

        if (tblTicketType == null || tblTicketPriceCode == null || tblTicketCode == null || tblEvent == null)
        {
            _logger.LogError("Invalid data provided for QR code generation.");
            return Result<QrGenerateResponseModel>.SystemError("Invalid data provided for QR code generation.");
        }

        string qrString = $"{tblEvent.Eventname}" +
            $"|{tblEvent.Eventcode}|" +
            $"{DateOnly.FromDateTime((DateTime)tblEvent.Startdate)}|" +
            $"|{tblEvent.Startdate}|" +
            $"|{tblEvent.Enddate}|" +
            $"{tblTicketCode.Ticketcode}|" +
            //$"|{tblEvent.GateOpenTime}|" +
            $"|{ticketCode}|" +
            $"{tblTicketPriceCode.Ticketprice}|" +
            $"{tblTicketType.Tickettypename}|" +
            $"{requestModel.FullName}|" +
            $"{requestModel.Email}|" +
            //$"{tblEvent.VenueCode}|"; + 
            $"{tblEvent.Address}";

        response.QrString = qrString;

        return Result<QrGenerateResponseModel>.Success(response, "QR code generated successfully.");

    }

}
