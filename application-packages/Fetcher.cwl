{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "hints": {
        "DockerRequirement": {
            "dockerPull": "docker-registry.crim.ca/ogc-public/fetcher:v1"
        }
    },
    "arguments": [$(inputs.input), $(runtime.outdir)],
    "inputs": {
        "input": {
            "type": "File[]"
        }
    },
    "outputs": {
        "output": {
            "outputBinding": {
                "glob": "*.zip"
            },
            "type": "File[]"
        }
    }
}
