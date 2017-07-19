package controllers;

import akka.stream.IOResult;
import akka.stream.Materializer;
import akka.stream.javadsl.FileIO;
import akka.stream.javadsl.Sink;
import akka.util.ByteString;
import play.core.parsers.Multipart;
import play.libs.streams.Accumulator;
import play.mvc.BodyParser;
import play.mvc.Http;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.PosixFilePermission;
import java.util.EnumSet;
import java.util.concurrent.CompletionStage;
import java.util.function.Function;

import static java.nio.file.attribute.PosixFilePermission.OWNER_READ;
import static java.nio.file.attribute.PosixFilePermission.OWNER_WRITE;

class UploadMultipartFormDataBodyParser extends BodyParser.DelegatingMultipartFormDataBodyParser<File>
{
    @Inject
    public UploadMultipartFormDataBodyParser(Materializer materializer, play.api.http.HttpConfiguration config)
    {
        super(materializer, config.parser().maxDiskBuffer());
    }


    @Override
    public Function<Multipart.FileInfo, Accumulator<ByteString, Http.MultipartFormData.FilePart<File>>> createFilePartHandler()
    {
        return (Multipart.FileInfo fileInfo) ->
        {
            final String filename = fileInfo.fileName();
            final String partname = fileInfo.partName();
            final String contentType = fileInfo.contentType().get();
            final File file = generateTempFile();

            final Sink<ByteString, CompletionStage<IOResult>> sink = FileIO.toFile(file);

            return Accumulator.fromSink(
                    sink.mapMaterializedValue(completionStage ->
                            completionStage.thenApplyAsync(results ->
                            {
                                return new Http.MultipartFormData.FilePart(partname, filename, contentType, file);
                            })

                    ));
        };
    }

    private File generateTempFile()
    {
        try
        {
            final EnumSet<PosixFilePermission> attrs = EnumSet.of(OWNER_READ, OWNER_WRITE);

            final Path path = Files.createTempFile("multipartBody", "tempFile");
            return path.toFile();
        }
        catch (IOException e)
        {
            throw new IllegalStateException(e);
        }
    }

}
