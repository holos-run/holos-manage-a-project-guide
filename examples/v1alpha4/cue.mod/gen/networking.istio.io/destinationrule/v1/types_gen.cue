// Code generated by timoni. DO NOT EDIT.

//timoni:generate timoni vendor crd -f deploy/clusters/aws2/components/istio-base/istio-base.gen.yaml

package v1

import "strings"

#DestinationRule: {
	// Configuration affecting load balancing, outlier detection, etc.
	// See more details at:
	// https://istio.io/docs/reference/config/networking/destination-rule.html
	spec!:      #DestinationRuleSpec
	apiVersion: "networking.istio.io/v1"
	kind:       "DestinationRule"
	metadata!: {
		name!: strings.MaxRunes(253) & strings.MinRunes(1) & {
			string
		}
		namespace!: strings.MaxRunes(63) & strings.MinRunes(1) & {
			string
		}
		labels?: {
			[string]: string
		}
		annotations?: {
			[string]: string
		}
	}
}

// Configuration affecting load balancing, outlier detection, etc.
// See more details at:
// https://istio.io/docs/reference/config/networking/destination-rule.html
#DestinationRuleSpec: {
	// A list of namespaces to which this destination rule is
	// exported.
	exportTo?: [...string]

	// The name of a service from the service registry.
	host: string

	// One or more named sets that represent individual versions of a
	// service.
	subsets?: [...{
		// Labels apply a filter over the endpoints of a service in the
		// service registry.
		labels?: {
			[string]: string
		}

		// Name of the subset.
		name: string

		// Traffic policies that apply to this subset.
		trafficPolicy?: {
			connectionPool?: {
				// HTTP connection pool settings.
				http?: {
					// Specify if http1.1 connection should be upgraded to http2 for
					// the associated destination.
					//
					// Valid Options: DEFAULT, DO_NOT_UPGRADE, UPGRADE
					h2UpgradePolicy?: "DEFAULT" | "DO_NOT_UPGRADE" | "UPGRADE"

					// Maximum number of requests that will be queued while waiting
					// for a ready connection pool connection.
					http1MaxPendingRequests?: int

					// Maximum number of active requests to a destination.
					http2MaxRequests?: int

					// The idle timeout for upstream connection pool connections.
					idleTimeout?: string

					// The maximum number of concurrent streams allowed for a peer on
					// one HTTP/2 connection.
					maxConcurrentStreams?: int

					// Maximum number of requests per connection to a backend.
					maxRequestsPerConnection?: int

					// Maximum number of retries that can be outstanding to all hosts
					// in a cluster at a given time.
					maxRetries?: int

					// If set to true, client protocol will be preserved while
					// initiating connection to backend.
					useClientProtocol?: bool
				}

				// Settings common to both HTTP and TCP upstream connections.
				tcp?: {
					// TCP connection timeout.
					connectTimeout?: string

					// The idle timeout for TCP connections.
					idleTimeout?: string

					// The maximum duration of a connection.
					maxConnectionDuration?: string

					// Maximum number of HTTP1 /TCP connections to a destination host.
					maxConnections?: int

					// If set then set SO_KEEPALIVE on the socket to enable TCP
					// Keepalives.
					tcpKeepalive?: {
						// The time duration between keep-alive probes.
						interval?: string

						// Maximum number of keepalive probes to send without response
						// before deciding the connection is dead.
						probes?: uint32

						// The time duration a connection needs to be idle before
						// keep-alive probes start being sent.
						time?: string
					}
				}
			}

			// Settings controlling the load balancer algorithms.
			loadBalancer?: ({} | {
				simple: _
			} | {
				consistentHash: _
			}) & {
				consistentHash?: ({} | {
					httpHeaderName: _
				} | {
					httpCookie: _
				} | {
					useSourceIp: _
				} | {
					httpQueryParameterName: _
				}) & ({} | {
					ringHash: _
				} | {
					maglev: _
				}) & {
					// Hash based on HTTP cookie.
					httpCookie?: {
						// Name of the cookie.
						name: string

						// Path to set for the cookie.
						path?: string

						// Lifetime of the cookie.
						ttl?: string
					}

					// Hash based on a specific HTTP header.
					httpHeaderName?: string

					// Hash based on a specific HTTP query parameter.
					httpQueryParameterName?: string
					maglev?: {
						// The table size for Maglev hashing.
						tableSize?: >=0 & int
					}

					// Deprecated.
					minimumRingSize?: >=0 & int
					ringHash?: {
						// The minimum number of virtual nodes to use for the hash ring.
						minimumRingSize?: >=0 & int
					}

					// Hash based on the source IP address.
					useSourceIp?: bool
				}
				localityLbSetting?: {
					// Optional: only one of distribute, failover or failoverPriority
					// can be set.
					distribute?: [...{
						// Originating locality, '/' separated, e.g.
						from?: string

						// Map of upstream localities to traffic distribution weights.
						to?: {
							[string]: int & <=4294967295 & >=0
						}
					}]

					// enable locality load balancing, this is DestinationRule-level
					// and will override mesh wide settings in entirety.
					enabled?: null | bool

					// Optional: only one of distribute, failover or failoverPriority
					// can be set.
					failover?: [...{
						// Originating region.
						from?: string

						// Destination region the traffic will fail over to when endpoints
						// in the 'from' region becomes unhealthy.
						to?: string
					}]

					// failoverPriority is an ordered list of labels used to sort
					// endpoints to do priority based load balancing.
					failoverPriority?: [...string]
				}

				// Valid Options: LEAST_CONN, RANDOM, PASSTHROUGH, ROUND_ROBIN,
				// LEAST_REQUEST
				simple?: "UNSPECIFIED" | "LEAST_CONN" | "RANDOM" | "PASSTHROUGH" | "ROUND_ROBIN" | "LEAST_REQUEST"

				// Represents the warmup duration of Service.
				warmupDurationSecs?: string
			}
			outlierDetection?: {
				// Minimum ejection duration.
				baseEjectionTime?: string

				// Number of 5xx errors before a host is ejected from the
				// connection pool.
				consecutive5xxErrors?: null | int & <=4294967295 & >=0
				consecutiveErrors?:    int

				// Number of gateway errors before a host is ejected from the
				// connection pool.
				consecutiveGatewayErrors?: null | int & <=4294967295 & >=0

				// The number of consecutive locally originated failures before
				// ejection occurs.
				consecutiveLocalOriginFailures?: null | int & <=4294967295 & >=0

				// Time interval between ejection sweep analysis.
				interval?: string

				// Maximum % of hosts in the load balancing pool for the upstream
				// service that can be ejected.
				maxEjectionPercent?: int

				// Outlier detection will be enabled as long as the associated
				// load balancing pool has at least min_health_percent hosts in
				// healthy mode.
				minHealthPercent?: int

				// Determines whether to distinguish local origin failures from
				// external errors.
				splitExternalLocalOriginErrors?: bool
			}

			// Traffic policies specific to individual ports.
			portLevelSettings?: [...{
				connectionPool?: {
					// HTTP connection pool settings.
					http?: {
						// Specify if http1.1 connection should be upgraded to http2 for
						// the associated destination.
						//
						// Valid Options: DEFAULT, DO_NOT_UPGRADE, UPGRADE
						h2UpgradePolicy?: "DEFAULT" | "DO_NOT_UPGRADE" | "UPGRADE"

						// Maximum number of requests that will be queued while waiting
						// for a ready connection pool connection.
						http1MaxPendingRequests?: int

						// Maximum number of active requests to a destination.
						http2MaxRequests?: int

						// The idle timeout for upstream connection pool connections.
						idleTimeout?: string

						// The maximum number of concurrent streams allowed for a peer on
						// one HTTP/2 connection.
						maxConcurrentStreams?: int

						// Maximum number of requests per connection to a backend.
						maxRequestsPerConnection?: int

						// Maximum number of retries that can be outstanding to all hosts
						// in a cluster at a given time.
						maxRetries?: int

						// If set to true, client protocol will be preserved while
						// initiating connection to backend.
						useClientProtocol?: bool
					}

					// Settings common to both HTTP and TCP upstream connections.
					tcp?: {
						// TCP connection timeout.
						connectTimeout?: string

						// The idle timeout for TCP connections.
						idleTimeout?: string

						// The maximum duration of a connection.
						maxConnectionDuration?: string

						// Maximum number of HTTP1 /TCP connections to a destination host.
						maxConnections?: int

						// If set then set SO_KEEPALIVE on the socket to enable TCP
						// Keepalives.
						tcpKeepalive?: {
							// The time duration between keep-alive probes.
							interval?: string

							// Maximum number of keepalive probes to send without response
							// before deciding the connection is dead.
							probes?: uint32

							// The time duration a connection needs to be idle before
							// keep-alive probes start being sent.
							time?: string
						}
					}
				}

				// Settings controlling the load balancer algorithms.
				loadBalancer?: ({} | {
					simple: _
				} | {
					consistentHash: _
				}) & {
					consistentHash?: ({} | {
						httpHeaderName: _
					} | {
						httpCookie: _
					} | {
						useSourceIp: _
					} | {
						httpQueryParameterName: _
					}) & ({} | {
						ringHash: _
					} | {
						maglev: _
					}) & {
						// Hash based on HTTP cookie.
						httpCookie?: {
							// Name of the cookie.
							name: string

							// Path to set for the cookie.
							path?: string

							// Lifetime of the cookie.
							ttl?: string
						}

						// Hash based on a specific HTTP header.
						httpHeaderName?: string

						// Hash based on a specific HTTP query parameter.
						httpQueryParameterName?: string
						maglev?: {
							// The table size for Maglev hashing.
							tableSize?: >=0 & int
						}

						// Deprecated.
						minimumRingSize?: >=0 & int
						ringHash?: {
							// The minimum number of virtual nodes to use for the hash ring.
							minimumRingSize?: >=0 & int
						}

						// Hash based on the source IP address.
						useSourceIp?: bool
					}
					localityLbSetting?: {
						// Optional: only one of distribute, failover or failoverPriority
						// can be set.
						distribute?: [...{
							// Originating locality, '/' separated, e.g.
							from?: string

							// Map of upstream localities to traffic distribution weights.
							to?: {
								[string]: int & <=4294967295 & >=0
							}
						}]

						// enable locality load balancing, this is DestinationRule-level
						// and will override mesh wide settings in entirety.
						enabled?: null | bool

						// Optional: only one of distribute, failover or failoverPriority
						// can be set.
						failover?: [...{
							// Originating region.
							from?: string

							// Destination region the traffic will fail over to when endpoints
							// in the 'from' region becomes unhealthy.
							to?: string
						}]

						// failoverPriority is an ordered list of labels used to sort
						// endpoints to do priority based load balancing.
						failoverPriority?: [...string]
					}

					// Valid Options: LEAST_CONN, RANDOM, PASSTHROUGH, ROUND_ROBIN,
					// LEAST_REQUEST
					simple?: "UNSPECIFIED" | "LEAST_CONN" | "RANDOM" | "PASSTHROUGH" | "ROUND_ROBIN" | "LEAST_REQUEST"

					// Represents the warmup duration of Service.
					warmupDurationSecs?: string
				}
				outlierDetection?: {
					// Minimum ejection duration.
					baseEjectionTime?: string

					// Number of 5xx errors before a host is ejected from the
					// connection pool.
					consecutive5xxErrors?: null | int & <=4294967295 & >=0
					consecutiveErrors?:    int

					// Number of gateway errors before a host is ejected from the
					// connection pool.
					consecutiveGatewayErrors?: null | int & <=4294967295 & >=0

					// The number of consecutive locally originated failures before
					// ejection occurs.
					consecutiveLocalOriginFailures?: null | int & <=4294967295 & >=0

					// Time interval between ejection sweep analysis.
					interval?: string

					// Maximum % of hosts in the load balancing pool for the upstream
					// service that can be ejected.
					maxEjectionPercent?: int

					// Outlier detection will be enabled as long as the associated
					// load balancing pool has at least min_health_percent hosts in
					// healthy mode.
					minHealthPercent?: int

					// Determines whether to distinguish local origin failures from
					// external errors.
					splitExternalLocalOriginErrors?: bool
				}
				port?: {
					number?: uint32
				}

				// TLS related settings for connections to the upstream service.
				tls?: {
					// OPTIONAL: The path to the file containing certificate authority
					// certificates to use in verifying a presented server
					// certificate.
					caCertificates?: string

					// OPTIONAL: The path to the file containing the certificate
					// revocation list (CRL) to use in verifying a presented server
					// certificate.
					caCrl?: string

					// REQUIRED if mode is `MUTUAL`.
					clientCertificate?: string

					// The name of the secret that holds the TLS certs for the client
					// including the CA certificates.
					credentialName?: string

					// `insecureSkipVerify` specifies whether the proxy should skip
					// verifying the CA signature and SAN for the server certificate
					// corresponding to the host.
					insecureSkipVerify?: null | bool

					// Indicates whether connections to this port should be secured
					// using TLS.
					//
					// Valid Options: DISABLE, SIMPLE, MUTUAL, ISTIO_MUTUAL
					mode?: "DISABLE" | "SIMPLE" | "MUTUAL" | "ISTIO_MUTUAL"

					// REQUIRED if mode is `MUTUAL`.
					privateKey?: string

					// SNI string to present to the server during TLS handshake.
					sni?: string

					// A list of alternate names to verify the subject identity in the
					// certificate.
					subjectAltNames?: [...string]
				}
			}]
			proxyProtocol?: {
				// The PROXY protocol version to use.
				//
				// Valid Options: V1, V2
				version?: "V1" | "V2"
			}

			// TLS related settings for connections to the upstream service.
			tls?: {
				// OPTIONAL: The path to the file containing certificate authority
				// certificates to use in verifying a presented server
				// certificate.
				caCertificates?: string

				// OPTIONAL: The path to the file containing the certificate
				// revocation list (CRL) to use in verifying a presented server
				// certificate.
				caCrl?: string

				// REQUIRED if mode is `MUTUAL`.
				clientCertificate?: string

				// The name of the secret that holds the TLS certs for the client
				// including the CA certificates.
				credentialName?: string

				// `insecureSkipVerify` specifies whether the proxy should skip
				// verifying the CA signature and SAN for the server certificate
				// corresponding to the host.
				insecureSkipVerify?: null | bool

				// Indicates whether connections to this port should be secured
				// using TLS.
				//
				// Valid Options: DISABLE, SIMPLE, MUTUAL, ISTIO_MUTUAL
				mode?: "DISABLE" | "SIMPLE" | "MUTUAL" | "ISTIO_MUTUAL"

				// REQUIRED if mode is `MUTUAL`.
				privateKey?: string

				// SNI string to present to the server during TLS handshake.
				sni?: string

				// A list of alternate names to verify the subject identity in the
				// certificate.
				subjectAltNames?: [...string]
			}

			// Configuration of tunneling TCP over other transport or
			// application layers for the host configured in the
			// DestinationRule.
			tunnel?: {
				// Specifies which protocol to use for tunneling the downstream
				// connection.
				protocol?: string

				// Specifies a host to which the downstream connection is
				// tunneled.
				targetHost: string

				// Specifies a port to which the downstream connection is
				// tunneled.
				targetPort: uint32
			}
		}
	}]

	// Traffic policies to apply (load balancing policy, connection
	// pool sizes, outlier detection).
	trafficPolicy?: {
		connectionPool?: {
			// HTTP connection pool settings.
			http?: {
				// Specify if http1.1 connection should be upgraded to http2 for
				// the associated destination.
				//
				// Valid Options: DEFAULT, DO_NOT_UPGRADE, UPGRADE
				h2UpgradePolicy?: "DEFAULT" | "DO_NOT_UPGRADE" | "UPGRADE"

				// Maximum number of requests that will be queued while waiting
				// for a ready connection pool connection.
				http1MaxPendingRequests?: int

				// Maximum number of active requests to a destination.
				http2MaxRequests?: int

				// The idle timeout for upstream connection pool connections.
				idleTimeout?: string

				// The maximum number of concurrent streams allowed for a peer on
				// one HTTP/2 connection.
				maxConcurrentStreams?: int

				// Maximum number of requests per connection to a backend.
				maxRequestsPerConnection?: int

				// Maximum number of retries that can be outstanding to all hosts
				// in a cluster at a given time.
				maxRetries?: int

				// If set to true, client protocol will be preserved while
				// initiating connection to backend.
				useClientProtocol?: bool
			}

			// Settings common to both HTTP and TCP upstream connections.
			tcp?: {
				// TCP connection timeout.
				connectTimeout?: string

				// The idle timeout for TCP connections.
				idleTimeout?: string

				// The maximum duration of a connection.
				maxConnectionDuration?: string

				// Maximum number of HTTP1 /TCP connections to a destination host.
				maxConnections?: int

				// If set then set SO_KEEPALIVE on the socket to enable TCP
				// Keepalives.
				tcpKeepalive?: {
					// The time duration between keep-alive probes.
					interval?: string

					// Maximum number of keepalive probes to send without response
					// before deciding the connection is dead.
					probes?: uint32

					// The time duration a connection needs to be idle before
					// keep-alive probes start being sent.
					time?: string
				}
			}
		}

		// Settings controlling the load balancer algorithms.
		loadBalancer?: ({} | {
			simple: _
		} | {
			consistentHash: _
		}) & {
			consistentHash?: ({} | {
				httpHeaderName: _
			} | {
				httpCookie: _
			} | {
				useSourceIp: _
			} | {
				httpQueryParameterName: _
			}) & ({} | {
				ringHash: _
			} | {
				maglev: _
			}) & {
				// Hash based on HTTP cookie.
				httpCookie?: {
					// Name of the cookie.
					name: string

					// Path to set for the cookie.
					path?: string

					// Lifetime of the cookie.
					ttl?: string
				}

				// Hash based on a specific HTTP header.
				httpHeaderName?: string

				// Hash based on a specific HTTP query parameter.
				httpQueryParameterName?: string
				maglev?: {
					// The table size for Maglev hashing.
					tableSize?: >=0 & int
				}

				// Deprecated.
				minimumRingSize?: >=0 & int
				ringHash?: {
					// The minimum number of virtual nodes to use for the hash ring.
					minimumRingSize?: >=0 & int
				}

				// Hash based on the source IP address.
				useSourceIp?: bool
			}
			localityLbSetting?: {
				// Optional: only one of distribute, failover or failoverPriority
				// can be set.
				distribute?: [...{
					// Originating locality, '/' separated, e.g.
					from?: string

					// Map of upstream localities to traffic distribution weights.
					to?: {
						[string]: int & <=4294967295 & >=0
					}
				}]

				// enable locality load balancing, this is DestinationRule-level
				// and will override mesh wide settings in entirety.
				enabled?: null | bool

				// Optional: only one of distribute, failover or failoverPriority
				// can be set.
				failover?: [...{
					// Originating region.
					from?: string

					// Destination region the traffic will fail over to when endpoints
					// in the 'from' region becomes unhealthy.
					to?: string
				}]

				// failoverPriority is an ordered list of labels used to sort
				// endpoints to do priority based load balancing.
				failoverPriority?: [...string]
			}

			// Valid Options: LEAST_CONN, RANDOM, PASSTHROUGH, ROUND_ROBIN,
			// LEAST_REQUEST
			simple?: "UNSPECIFIED" | "LEAST_CONN" | "RANDOM" | "PASSTHROUGH" | "ROUND_ROBIN" | "LEAST_REQUEST"

			// Represents the warmup duration of Service.
			warmupDurationSecs?: string
		}
		outlierDetection?: {
			// Minimum ejection duration.
			baseEjectionTime?: string

			// Number of 5xx errors before a host is ejected from the
			// connection pool.
			consecutive5xxErrors?: null | int & <=4294967295 & >=0
			consecutiveErrors?:    int

			// Number of gateway errors before a host is ejected from the
			// connection pool.
			consecutiveGatewayErrors?: null | int & <=4294967295 & >=0

			// The number of consecutive locally originated failures before
			// ejection occurs.
			consecutiveLocalOriginFailures?: null | int & <=4294967295 & >=0

			// Time interval between ejection sweep analysis.
			interval?: string

			// Maximum % of hosts in the load balancing pool for the upstream
			// service that can be ejected.
			maxEjectionPercent?: int

			// Outlier detection will be enabled as long as the associated
			// load balancing pool has at least min_health_percent hosts in
			// healthy mode.
			minHealthPercent?: int

			// Determines whether to distinguish local origin failures from
			// external errors.
			splitExternalLocalOriginErrors?: bool
		}

		// Traffic policies specific to individual ports.
		portLevelSettings?: [...{
			connectionPool?: {
				// HTTP connection pool settings.
				http?: {
					// Specify if http1.1 connection should be upgraded to http2 for
					// the associated destination.
					//
					// Valid Options: DEFAULT, DO_NOT_UPGRADE, UPGRADE
					h2UpgradePolicy?: "DEFAULT" | "DO_NOT_UPGRADE" | "UPGRADE"

					// Maximum number of requests that will be queued while waiting
					// for a ready connection pool connection.
					http1MaxPendingRequests?: int

					// Maximum number of active requests to a destination.
					http2MaxRequests?: int

					// The idle timeout for upstream connection pool connections.
					idleTimeout?: string

					// The maximum number of concurrent streams allowed for a peer on
					// one HTTP/2 connection.
					maxConcurrentStreams?: int

					// Maximum number of requests per connection to a backend.
					maxRequestsPerConnection?: int

					// Maximum number of retries that can be outstanding to all hosts
					// in a cluster at a given time.
					maxRetries?: int

					// If set to true, client protocol will be preserved while
					// initiating connection to backend.
					useClientProtocol?: bool
				}

				// Settings common to both HTTP and TCP upstream connections.
				tcp?: {
					// TCP connection timeout.
					connectTimeout?: string

					// The idle timeout for TCP connections.
					idleTimeout?: string

					// The maximum duration of a connection.
					maxConnectionDuration?: string

					// Maximum number of HTTP1 /TCP connections to a destination host.
					maxConnections?: int

					// If set then set SO_KEEPALIVE on the socket to enable TCP
					// Keepalives.
					tcpKeepalive?: {
						// The time duration between keep-alive probes.
						interval?: string

						// Maximum number of keepalive probes to send without response
						// before deciding the connection is dead.
						probes?: uint32

						// The time duration a connection needs to be idle before
						// keep-alive probes start being sent.
						time?: string
					}
				}
			}

			// Settings controlling the load balancer algorithms.
			loadBalancer?: ({} | {
				simple: _
			} | {
				consistentHash: _
			}) & {
				consistentHash?: ({} | {
					httpHeaderName: _
				} | {
					httpCookie: _
				} | {
					useSourceIp: _
				} | {
					httpQueryParameterName: _
				}) & ({} | {
					ringHash: _
				} | {
					maglev: _
				}) & {
					// Hash based on HTTP cookie.
					httpCookie?: {
						// Name of the cookie.
						name: string

						// Path to set for the cookie.
						path?: string

						// Lifetime of the cookie.
						ttl?: string
					}

					// Hash based on a specific HTTP header.
					httpHeaderName?: string

					// Hash based on a specific HTTP query parameter.
					httpQueryParameterName?: string
					maglev?: {
						// The table size for Maglev hashing.
						tableSize?: >=0 & int
					}

					// Deprecated.
					minimumRingSize?: >=0 & int
					ringHash?: {
						// The minimum number of virtual nodes to use for the hash ring.
						minimumRingSize?: >=0 & int
					}

					// Hash based on the source IP address.
					useSourceIp?: bool
				}
				localityLbSetting?: {
					// Optional: only one of distribute, failover or failoverPriority
					// can be set.
					distribute?: [...{
						// Originating locality, '/' separated, e.g.
						from?: string

						// Map of upstream localities to traffic distribution weights.
						to?: {
							[string]: int & <=4294967295 & >=0
						}
					}]

					// enable locality load balancing, this is DestinationRule-level
					// and will override mesh wide settings in entirety.
					enabled?: null | bool

					// Optional: only one of distribute, failover or failoverPriority
					// can be set.
					failover?: [...{
						// Originating region.
						from?: string

						// Destination region the traffic will fail over to when endpoints
						// in the 'from' region becomes unhealthy.
						to?: string
					}]

					// failoverPriority is an ordered list of labels used to sort
					// endpoints to do priority based load balancing.
					failoverPriority?: [...string]
				}

				// Valid Options: LEAST_CONN, RANDOM, PASSTHROUGH, ROUND_ROBIN,
				// LEAST_REQUEST
				simple?: "UNSPECIFIED" | "LEAST_CONN" | "RANDOM" | "PASSTHROUGH" | "ROUND_ROBIN" | "LEAST_REQUEST"

				// Represents the warmup duration of Service.
				warmupDurationSecs?: string
			}
			outlierDetection?: {
				// Minimum ejection duration.
				baseEjectionTime?: string

				// Number of 5xx errors before a host is ejected from the
				// connection pool.
				consecutive5xxErrors?: null | int & <=4294967295 & >=0
				consecutiveErrors?:    int

				// Number of gateway errors before a host is ejected from the
				// connection pool.
				consecutiveGatewayErrors?: null | int & <=4294967295 & >=0

				// The number of consecutive locally originated failures before
				// ejection occurs.
				consecutiveLocalOriginFailures?: null | int & <=4294967295 & >=0

				// Time interval between ejection sweep analysis.
				interval?: string

				// Maximum % of hosts in the load balancing pool for the upstream
				// service that can be ejected.
				maxEjectionPercent?: int

				// Outlier detection will be enabled as long as the associated
				// load balancing pool has at least min_health_percent hosts in
				// healthy mode.
				minHealthPercent?: int

				// Determines whether to distinguish local origin failures from
				// external errors.
				splitExternalLocalOriginErrors?: bool
			}
			port?: {
				number?: uint32
			}

			// TLS related settings for connections to the upstream service.
			tls?: {
				// OPTIONAL: The path to the file containing certificate authority
				// certificates to use in verifying a presented server
				// certificate.
				caCertificates?: string

				// OPTIONAL: The path to the file containing the certificate
				// revocation list (CRL) to use in verifying a presented server
				// certificate.
				caCrl?: string

				// REQUIRED if mode is `MUTUAL`.
				clientCertificate?: string

				// The name of the secret that holds the TLS certs for the client
				// including the CA certificates.
				credentialName?: string

				// `insecureSkipVerify` specifies whether the proxy should skip
				// verifying the CA signature and SAN for the server certificate
				// corresponding to the host.
				insecureSkipVerify?: null | bool

				// Indicates whether connections to this port should be secured
				// using TLS.
				//
				// Valid Options: DISABLE, SIMPLE, MUTUAL, ISTIO_MUTUAL
				mode?: "DISABLE" | "SIMPLE" | "MUTUAL" | "ISTIO_MUTUAL"

				// REQUIRED if mode is `MUTUAL`.
				privateKey?: string

				// SNI string to present to the server during TLS handshake.
				sni?: string

				// A list of alternate names to verify the subject identity in the
				// certificate.
				subjectAltNames?: [...string]
			}
		}]
		proxyProtocol?: {
			// The PROXY protocol version to use.
			//
			// Valid Options: V1, V2
			version?: "V1" | "V2"
		}

		// TLS related settings for connections to the upstream service.
		tls?: {
			// OPTIONAL: The path to the file containing certificate authority
			// certificates to use in verifying a presented server
			// certificate.
			caCertificates?: string

			// OPTIONAL: The path to the file containing the certificate
			// revocation list (CRL) to use in verifying a presented server
			// certificate.
			caCrl?: string

			// REQUIRED if mode is `MUTUAL`.
			clientCertificate?: string

			// The name of the secret that holds the TLS certs for the client
			// including the CA certificates.
			credentialName?: string

			// `insecureSkipVerify` specifies whether the proxy should skip
			// verifying the CA signature and SAN for the server certificate
			// corresponding to the host.
			insecureSkipVerify?: null | bool

			// Indicates whether connections to this port should be secured
			// using TLS.
			//
			// Valid Options: DISABLE, SIMPLE, MUTUAL, ISTIO_MUTUAL
			mode?: "DISABLE" | "SIMPLE" | "MUTUAL" | "ISTIO_MUTUAL"

			// REQUIRED if mode is `MUTUAL`.
			privateKey?: string

			// SNI string to present to the server during TLS handshake.
			sni?: string

			// A list of alternate names to verify the subject identity in the
			// certificate.
			subjectAltNames?: [...string]
		}

		// Configuration of tunneling TCP over other transport or
		// application layers for the host configured in the
		// DestinationRule.
		tunnel?: {
			// Specifies which protocol to use for tunneling the downstream
			// connection.
			protocol?: string

			// Specifies a host to which the downstream connection is
			// tunneled.
			targetHost: string

			// Specifies a port to which the downstream connection is
			// tunneled.
			targetPort: uint32
		}
	}
	workloadSelector?: {
		// One or more labels that indicate a specific set of pods/VMs on
		// which a policy should be applied.
		matchLabels?: {
			[string]: string
		}
	}
}
