{
    "cwlVersion": "v1.0",
    "class": "Workflow",
    "requirements": [
        {
            "class": "StepInputExpressionRequirement"
        }
    ],
    "inputs": {
        "input_files": "File[]",
        "output_type": "string",
        "output_name": "string"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "sfs/output"
        }
    },
    "steps": {
        "stack_creation": {
            "run": "StackCreation-graph-json-remote.cwl",
            "in": {
                "files": "input_files",
                "output_file_type": "output_type",
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
