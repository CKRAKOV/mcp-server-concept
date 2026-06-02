using System.ComponentModel;
using ModelContextProtocol.Server;
using CatMcp.Services;

namespace CatMcp;

[McpServerToolType]
public class CatMcpTool
{
    private readonly CatMcpService _service;

    public CatMcpTool(CatMcpService service)
    {
        _service = service;
    }

    [McpServerTool, Description("Retrieve one or more random cat facts from the configured Cat Facts API.")]
    public async Task<string> GetCatFacts(
        [Description("Number of random cat facts to retrieve.")] int count = 1)
    {
        return await _service.GetRandomFactsAsync(count);
    }
}
