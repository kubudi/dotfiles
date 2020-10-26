import org.ensime.Imports._

EnsimeKeys.compilerArgs in Compile := (scalacOptions in Compile).value ++ Seq("-Ywarn-dead-code", "-Ywarn-shadowing")

