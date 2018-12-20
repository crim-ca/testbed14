{
    "cwlVersion": "v1.0",
    "class": "Workflow",
    "requirements": [
        {
            "class": "StepInputExpressionRequirement"
        },
        {
            "class": "MultipleInputFeatureRequirement"
        }
    ],
    "inputs": {
        "image-s2": "File[]",
        "image-probav" : "File[]",
        "image-deimos" : "File[]"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "flood_detection/output"
        }
    },
    "steps": {
        "stacker_s2": {
            "run": "Stacker.cwl",
            "in": {
                "files": "image-s2"
            },
            "out": ["output"]
        },
        "stacker_probav": {
            "run": "Stacker.cwl",
            "in": {
                "files": "image-probav"
            },
            "out": ["output"]
        },
        "stacker_deimos": {
           "run": "Stacker.cwl",
           "in": {
                "files": "image-deimos"
            },
            "out": ["output"]
        },
        "stack_creation": {
            "run": "Stacker.cwl",
            "in": {
                "files": [
                    "stacker_s2/output",
                    "stacker_probav/output",
                    "stacker_deimos/output"
                ]
            },
            "out": ["output"]
        },
        "sfs": {
            "run": "SFS.cwl",
            "in": {
                "source_product": "stack_creation/output"
            },
            "out": ["output"]
        },
        "flood_detection": {
            "run": "FloodDetection.cwl",
            "in": {
                "source_product": "sfs/output"
            },
            "out": ["output"]
        }
    }
}
