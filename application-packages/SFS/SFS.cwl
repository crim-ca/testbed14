{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "hints": {
        "DockerRequirement": {
            "dockerPull": "docker-registry.crim.ca/ogc-public/snap6-sfs:v2.12"
        }
    },
    "arguments": ["-f", "BEAM-DIMAP", "-t", "sfs_output.dim"],
    "inputs": {
        "source_product": {
            "inputBinding": {
                "position": 1,
                "prefix": "-SsourceProduct=",
                "separate": false
            },
            "type": "File"
        }
    },
    "outputs": {
        "output": {
            "outputBinding": {
                "glob": "sfs_output.dim.zip"
            },
            "type": "File"
        }
    }
}
