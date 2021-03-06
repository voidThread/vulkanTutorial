VULKAN_SDK_PATH = ~/Storage1/programowanie/vulkan/1.1.101.0/x86_64
CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include -g3
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

#debug: CFLAGS += -DDEBUG -g -DNDEBUG
#debug: VulkanTest

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
		LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest
