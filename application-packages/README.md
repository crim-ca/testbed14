## Applications
We provide here two dockerized applications and one cwl workflow that link them.
The first application, the Stacker (id: StackCreation-graph-json-remote) take multiple inputs images (application/zip) and stack them into one image having multiple channels.
The second application, SFS (id: SFS-graph-json-remote) take the output of the first application and then extract features.
The Workflow application, link the first two applications together using a cwl workflow.

## Requirements
Our applications can be executed directly using the docker engine or by using cwl-runner. Thus, you will need at least one of these components:
* cwl-runner
* docker engine

### docker images
Our two dockerized applications are referenced in the DeployProcess_Stacker.json and DeployProcess_SFS.json files. They are also used by the cwl files.

### cwl-runner usage

cwl-runner requires two files to execute an application :
* The process workflow (e.g. Stacker : https://raw.githubusercontent.com/crim-ca/testbed14/master/application-packages/StackCreation-graph-json-remote.cwl)
* The parameters file which contains values for each of the workflow inputs (e.g. https://raw.githubusercontent.com/crim-ca/testbed14/master/application-packages/StackCreation-graph-json-zip.job)

The StackCreation-graph-json-zip.job contains the parameters values which include input image files. 
Currently we are using local path but cwl-runner should be able to fetch images directly if hosted on a proper file server. 
For your conveniance we have included links to samples images in the execute request payload (https://raw.githubusercontent.com/crim-ca/testbed14/workflow_offering/application-packages/Execute_Stacker.json), but the links doesn't include the extension and cwl-runner cannot fetch the files directly from there.

To execute the process:

cwl-runner --no-read-only StackCreation-graph-json-remote.cwl StackCreation-graph-json-zip.job

To execute the workflow:

cwl-runner --no-read-only Workflow.cwl Workflow-json-zip.job

In both cases the result will be available within the working directory.

* Note 1: Notice the --no-read-only flag because by default cwl launch the container in read-only mode preventing the application to write anywhere else the output directory.
* Note 2: cwl-runner must not be run as root because cwl-runner forward the host user inside the container and our application requires a standard user to run properly.
* Note 3: Our application needs at least 8 Go of RAM to run correctlty.
* Note 4: Make sure that the input files referenced in the parameters json are readable by the user running cwl-runner since they will need to be accessed inside the container via a mounted volume using the current user rights.
* Note 5: Also cwl-runner will create temporary folders in the /tmp directory and mounted them inside the container to store the output file. Make sure that the user running cwl-runner have write access to them. Using the cwl-runner "--debug" flag can help for that.