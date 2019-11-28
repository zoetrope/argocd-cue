package kube

import (
  "k8s.io/api/core/v1"
)

pod: [string]: v1.Pod

pod: test: {
	apiVersion: "v1"
	kind:       "Pod"
	metadata: {
		name: "test"
		labels: app: "testhttpd"
	}
	spec: containers: [{
		image:           "quay.io/cybozu/testhttpd:0.1.0"
		imagePullPolicy: "IfNotPresent"
		name:            "test"
		ports: [{
			containerPort: 8000
			protocol:      "TCP"
		}]
	}]
}
