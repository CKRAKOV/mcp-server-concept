using MCPServers.Shared;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace CatMcp.Services;

public class CatMcpService : BaseHttpService
{
    private readonly string _baseUrl;

    public CatMcpService(
        IConfiguration configuration,
        HttpClient client,
        ILogger<CatMcpService> logger)
        : base(configuration, client, logger)
    {
        _baseUrl = configuration["CatMcpApi:BaseUrl"]
            ?? throw new InvalidOperationException("CatMcpApi:BaseUrl is not configured");
    }

    public async Task<string> GetRandomFactsAsync(int count = 1)
    {
        if (count < 1)
        {
            throw new ArgumentOutOfRangeException(nameof(count), "Count must be at least 1.");
        }

        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var facts = new List<string>(count);

        for (var i = 0; i < count; i++)
        {
            var url = $"{_baseUrl}/fact";
            var responseContent = await GetAsync(url);
            var fact = JsonSerializer.Deserialize<CatFact>(responseContent, options);
            if (!string.IsNullOrWhiteSpace(fact?.Text))
            {
                facts.Add(fact.Text);
            }
        }

        if (!facts.Any())
        {
            return "No cat facts were returned.";
        }

        if (facts.Count == 1)
        {
            return facts[0];
        }

        return string.Join(Environment.NewLine, facts.Select((text, index) => $"{index + 1}. {text}"));
    }

    private sealed record CatFact(
        [property: JsonPropertyName("fact")] string Text
    );
}
