package kube

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