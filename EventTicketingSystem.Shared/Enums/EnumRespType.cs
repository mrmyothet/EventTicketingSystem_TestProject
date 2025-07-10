using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventTicketingSystem.Shared.Enums;

public enum EnumRespType
{
    None,
    Success,
    Error,
    ValidationError,
    NotFound,
    DuplicateRecord,
    UserInputError
}
