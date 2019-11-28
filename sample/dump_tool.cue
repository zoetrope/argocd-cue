package kube

import (
	"encoding/yaml"
	"tool/cli"
)

objects: [ x for v in objectSets for x in v ]

objectSets: [
	pod,
]

command: dump: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
