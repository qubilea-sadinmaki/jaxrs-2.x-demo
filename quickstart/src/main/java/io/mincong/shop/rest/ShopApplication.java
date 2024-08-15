package io.mincong.shop.rest;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.Path;
import javax.ws.rs.core.Application;

@Path("/app")
public class ShopApplication extends Application {

  @Override
  public Set<Class<?>> getClasses() {
    Set<Class<?>> set = new HashSet<>();
    set.add(PingResource.class);
    set.add(PongResource.class);
    set.add(PingPongResource.class);
    return set;
  }

  @Override
  public Set<Object> getSingletons() {
    return Collections.emptySet();
  }
}
