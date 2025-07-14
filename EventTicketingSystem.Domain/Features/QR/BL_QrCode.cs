using EventTicketingSystem.Domain.Models.Features.QR;

namespace EventTicketingSystem.Domain.Features.QR;

public class BL_QrCode
{
    private readonly DA_QrCode _da_QrCode;

    public BL_QrCode(DA_QrCode da_QrCode)
    {
        _da_QrCode = da_QrCode;
    }

    public async Task<Result<QrGenerateResponseModel>> Create(QrGenerateRequestModel requestModel)
    {
        var response = await _da_QrCode.GenerateQr(requestModel);

        if (string.IsNullOrEmpty(response.Data.QrString))
        {
            return Result<QrGenerateResponseModel>.SystemError("Failed to generate QR code.");
        }

        response.Message = "QR code generated successfully.";

        return response;
    }
}
