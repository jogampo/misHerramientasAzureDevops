
using Microsoft.TeamFoundation.DistributedTask.WebApi;
using Microsoft.VisualStudio.Services.Common;
using Microsoft.VisualStudio.Services.WebApi;


// Replace with your Azure DevOps Server URL
const String c_collectionUri = "https://miurl.com/";
// Replace with your Azure DevOps Server project
const String c_projectName = "PROJECTNAME";
// Replace with your PAT
const string PAT = "PAT";
// Default Library Name
string libraryName = "LIBRARYNAME";

if (args.Length == 1)
{
    if (args[1] == "Ayuda")
    {
        Console.WriteLine("Puede proporcionar como parámetro la library de la que quiere ver los datos");
        return;
    }
    else
    {
        libraryName = args[1];
    }
}



Uri orgUrl = new Uri(c_collectionUri);

// Connect to Azure DevOps Services
VssConnection connection = new VssConnection(orgUrl, new VssBasicCredential(string.Empty, PAT));

// Get a GitHttpClient to talk to the Git endpoints
using (TaskAgentHttpClient taskAgentClient = connection.GetClient<TaskAgentHttpClient>())
{
    // Get data about a specific repository
    var variableGroups = await taskAgentClient.GetVariableGroupsAsync(project: c_projectName);

    // Mostrar los nombres e IDs de los grupos de variables
    foreach (var group in variableGroups)
    {
        if (group.Name == libraryName)


            // Listar variables en el grupo
            foreach (var variable in group.Variables)
            {
                Console.WriteLine($"Variable:{variable.Key}Valor:{variable.Value.Value}");
            }
    }

}