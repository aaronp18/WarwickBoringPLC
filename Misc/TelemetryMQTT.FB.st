// Sends the required telemetry to the supplied MQTT server
FUNCTION_BLOCK TelemetryMQTT
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
	MQTT_IN_OUT : MQTT.MQTT_IN_OUT;

	HandleMQTT : MQTT.MqttClient;

	PublishMQTT : MQTT.MQTTPublish;
	init : BOOL;
	doPublish : BOOL := FALSE;

	url : STRING := '192.168.0.133:1883';
	topic : STRING := 'topic';
	payloadString : STRING := 'Hello there';



END_VAR


HandleMQTT(

	MQTT_IN_OUT := MQTT_IN_OUT,
	ENABLE := TRUE,
	URL := url,
	TIMEOUT := T#1s,
	TLS := FALSE
);

IF NOT init THEN
	init := TRUE;
	PublishMQTT.SetMqttInOut(MQTT_IN_OUT := MQTT_IN_OUT);

END_IF


PublishMQTT(
	Topic := ADR(url),
	PayloadString := ADR(payloadString),
	PublishAsString := TRUE,
	QoSIn := MQTT.QoS.ExactlyOnce,
	MRetain := FALSE,
	send := visuGVL.meResetFlowMeter);


