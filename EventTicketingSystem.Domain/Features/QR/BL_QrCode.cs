using Microsoft.VisualBasic;
using System.Drawing;
using System.Drawing.Imaging;
using ZXing;
using ZXing.Common;
using ZXing.Windows.Compatibility;

namespace EventTicketingSystem.Domain.Features.QR;

public class BL_QrCode
{
    private readonly DA_QrCode _da_QrCode;

    private const BarcodeFormat DEFAULT_BARCODE_FORMAT = BarcodeFormat.QR_CODE;
    private static readonly ImageFormat DEFAULT_IMAGE_FORMAT = ImageFormat.Png;

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

        string outputFileName = requestModel.TicketCode + "_" + requestModel.Email + ".png";

        // Generate the QR code image using ZXing
        var writer = new BarcodeWriter<Bitmap>
        {
            Format = DEFAULT_BARCODE_FORMAT,
            Options = new EncodingOptions
            {
                Width = 300,
                Height = 300
            }, 
            Renderer = new BitmapRenderer()
        };


        var bitmap = writer.Write(response.Data.QrString);

        bitmap.Save(outputFileName, DEFAULT_IMAGE_FORMAT);

        return response;
    }
}
