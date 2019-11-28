package kube

import (
  "k8s.io/api/core/v1"
)

pod: [string]: v1.Pod

pod: <Name>: {
	apiVersion: "v1"
	kind:       "Pod"
	metadata: {
		name: Name
		labels: app: "testhttpd"
	}
	spec: containers: [{
		image:           "quay.io/cybozu/testhttpd:0.1.0"
		imagePullPolicy: "IfNotPresent"
		name:            Name
		ports: [{
			containerPort: 8000
			protocol:      "TCP"
		}]
	}]
}

for x in [ "test1", "test2", "test3" ] {
	pod "\(x)": {}
}
