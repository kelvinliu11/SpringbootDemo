package com.kelvin.healthCheck;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/6/28.13:54
 * 样例的最终结果会在/health端点中，包含"custom":{"status":"UP"}
 */
@Component
public class CustomHealthIndicator implements HealthIndicator {
    @Override
    public Health health() {
        return Health.up().build();
    }
}
