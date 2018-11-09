{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "requirements": {
        "DockerRequirement": {
            "dockerPull": "docker-registry.crim.ca/ogc-public/snap6-stack-creation:v2.8"
        }
    },
    "inputs": {
        "files": {
            "inputBinding": {
                "position": 1,
                "prefix": "-Pfiles=",
                "separate": false,
                "itemSeparator": ","
            },
            "type": {
                "type": "array",
                "items": "File"
            }
        }
    },
    "outputs": {
        "output": {
            "outputBinding": {
                "glob": "output.dim.zip"
            },
            "type": "File"
        }
    }
}
