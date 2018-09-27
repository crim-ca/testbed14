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
        "image-deimos" : "File[]",
        "output_name" : "string",
        "output_type" : "string"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "sfs/output"
        }
    },
    "steps": {
                "fetcher_s2": {
                        "run": "Fetcher.cwl",
                        "in": {
                            "input": "image-s2"
                        },
                        "out": ["output"]
                },
                "fetcher_probav": {
                        "run": "Fetcher.cwl",
                        "in": {
                            "input": "image-probav"
                        },
                        "out": ["output"]
                },
                "fetcher_deimos": {
                        "run": "Fetcher.cwl",
                        "in": {
                            "input": "image-deimos"
                        },
                        "out": ["output"]
                },
        "stack_creation": {
            "run": "StackCreation-graph-json-remote.cwl",
            "in": {
                "files": {
                    "source" : [
                        "fetcher_s2/output",
                        "fetcher_probav/output",
                        "fetcher_deimos/output"
                    ],
                    "linkMerge": "merge_flattened"
                },
                "output_file_type" : "output_type",
                "output_name": {
                    "valueFrom": "stack_result.tif"
                }
            },
            "out": ["output"]
        },
        "sfs": {
            "run": "SFS-graph-json-remote.cwl",
            "in": {
                "source_product": "stack_creation/output",
                "output_file_type": "output_type",
                "output_name": "output_name"
            },
            "out": ["output"]
        }
    }
}
