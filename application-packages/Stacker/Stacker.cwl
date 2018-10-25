{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "requirements": {
        "DockerRequirement": {
            "dockerPull": "docker-registry.crim.ca/ogc-public/snap6-stack-creation:v2.5"
        }
    },
    "arguments": ["-f", "BEAM-DIMAP", "-t", "stacker_output.dim"],
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
                "glob": "stacker_output.dim.zip"
            },
            "type": "File"
        }
    }
}
