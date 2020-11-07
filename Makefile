CC=arm-none-eabi-gcc

CFLAGS=-iquote Ethernet -iquote Application -iquote Internet -Wall

OBJDIR=build
VPATH=Ethernet:Ethernet/W5500:Internet/DHCP:Internet/DNS:Internet/MQTT:Internet/MQTT/MQTTPacket/src:Internet/httpServer:Internet/SNTP

OBJS=$(addprefix $(OBJDIR)/,wizchip_conf.o socket.o w5500.o \
  dhcp.o \
  dns.o \
  httpParser.o httpServer.o httpUtil.o \
  sntp.o \
  MQTTConnectClient.o MQTTConnectServer.o MQTTDeserializePublish.o MQTTFormat.o MQTTPacket.o MQTTSerializePublish.o MQTTSubscribeClient.o MQTTSubscribeServer.o \
  MQTTUnsubscribeClient.o MQTTUnsubscribeServer.o \
  mqtt_interface.o MQTTClient.o \
)




all:	$(OBJS)
	ls $^

$(OBJDIR)/%.o:	%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJS): | $(OBJDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

.PHONY: clean
clean:
	-rm -rf $(OBJDIR)
