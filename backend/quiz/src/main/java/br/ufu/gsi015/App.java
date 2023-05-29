package br.ufu.gsi015;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan("br.ufu.gsi015.model") // the package containing your entities
@EnableJpaRepositories("br.ufu.gsi015.repository") // the package containing your repositories
public class App
{
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
