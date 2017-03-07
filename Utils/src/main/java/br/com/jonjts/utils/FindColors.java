package br.com.jonjts.utils;

import br.com.jonjts.renamevideos.model.*;
import br.com.jonjts.renamevideos.model.Movie;
import br.com.jonjts.utils.color.ColorThief;
import br.com.jonjts.utils.color.ColorUtil;
import br.com.jonjts.utils.persistence.MovieColorPersistence;
import br.com.jonjts.utils.persistence.MoviePersistence;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;

import org.jcodec.api.FrameGrab;
import org.jcodec.common.FileChannelWrapper;
import org.jcodec.common.NIOUtils;
import org.jcodec.common.RunLength;
import org.jcodec.common.model.Picture;
import org.jcodec.containers.mp4.demuxer.AbstractMP4DemuxerTrack;
import org.jcodec.containers.mp4.demuxer.MP4Demuxer;
import org.jcodec.scale.AWTUtil;

/**
 * @author jon_j
 */
public class FindColors {

    private static final int COLOR_NUMBER = 3;

    private static final int IGUALDADE_CORES = 80;

    private static HashMap<Color, Integer> videosColors = new HashMap<>();

    public static void main(String[] args) throws SQLException {
        File directory = new File("D:\\jonas\\Filmes");
        String[] list = directory.list();
        int count = 1;
        MoviePersistence moviePersistence = new MoviePersistence();

        for (String s : list) {
            int id = Integer.parseInt(s.replace(".mp4", ""));
            try {
                System.out.println("------ INICIANDO " + s + " ------ [ " + (count++) + " de " + list.length + " ]");
                MovieColorPersistence movieColorPersistence = new MovieColorPersistence();


                QueryBuilder<MoviesColor, Integer> moviesColorIntegerQueryBuilder = movieColorPersistence.queryBuilder();

                Integer[] objects = {109673, 109673, 128606, 89864, 138204, 147426, 111743, 118898, 148238, 95207, 106417, 94672, 96667, 91673, 84414, 107559, 97744, 107348, 92439, 91414, 128616, 87192, 161336, 89745, 122892, 79824, 78264, 130642, 149606, 98124, 99813, 79274, 112653, 85131, 141890, 91869, 94070, 99811, 85399, 106011, 86000, 91273, 87975, 122920, 88140, 110102, 97470, 81786, 79588, 112735, 111443, 82169, 91505, 150401, 110611, 89087, 132888, 99741, 88950, 141956, 93700, 105755, 88163, 146656, 101142, 89761, 76293, 112623, 83803, 106642, 122904, 74688, 77191, 77206, 86014, 79428, 92210, 117192, 93272, 107953, 115624, 140152, 127144, 88380, 85342, 106873, 99846, 104757, 116887, 79695, 81641, 86644, 81932, 94266, 92665, 111228, 112421, 116660, 88405, 101947, 103624, 89321, 93498, 109359, 129009, 74545, 91658, 143377, 84637, 111364, 127152, 80241, 87430, 79134, 82854, 138696, 100163, 101904, 81834, 161582, 117511, 88810, 97836, 133195, 98809, 106489, 92206, 156726, 85056, 89388, 104339, 113532, 135567, 98122, 105121, 94919, 112334, 93805, 90719, 108188, 98083, 106062, 78517, 111235, 93363, 103671, 78467, 92681, 99609, 115170, 104419, 103659, 86884, 130083, 89840, 119145, 79185, 92751, 87222, 146501, 82931, 80615, 91548, 155611, 82852, 86345, 92535, 127098, 104069, 94024, 82167, 102905, 80219, 122882, 95105, 150856, 106839, 149532, 83827, 117895, 127202, 85020, 81564, 160567, 112689, 91630, 111781, 162672, 104312, 100083, 109846, 87483, 110297, 91094, 161084, 156609, 160954, 81788, 119155, 115569, 113938, 132074, 112655, 84374, 111529, 108727, 108981, 101864, 116136, 106473, 108076, 96563, 81417, 107769, 102753, 97826, 132157, 148168, 74530, 100106, 101531, 79879, 96448, 86880, 112460, 159755, 86835, 78105, 112818, 103655, 84944, 82242, 129313, 75341, 139116, 80363, 113416, 83506, 86298, 98243, 108945, 136800, 99615, 81132, 95873, 162542, 79293, 107141, 81535, 148372, 79702, 83480, 80839, 135518, 118700, 97870, 132333, 78174, 90531, 136305, 161918, 91542, 150548, 163056, 100383, 96020, 115877, 113573, 156387, 107042, 86626, 109317, 152025, 85414, 96849, 115231, 122886, 140715, 85510, 85213, 161155, 87306, 160656, 159690, 80026, 120799, 89904, 163949, 130980, 111921, 128360, 118696, 106487, 116823, 135133, 156607, 131724, 135532, 138036, 134130, 138546, 126430, 160565, 110501, 93838, 148652, 79136, 106072, 147010, 127158, 142068, 82173, 87660, 74698, 90717, 78499, 100745, 112370, 87520, 106762, 87205, 91104, 78772, 79677, 91974, 129737, 96815, 140523, 81191, 80590, 91126, 99007, 83374, 86548, 91653, 91199, 110348, 127164, 84304, 90576, 130452, 112552, 112550, 83332, 107382, 85881, 89300, 104283, 84160, 103444, 148881, 122924, 111362, 87232, 108514, 83177, 77837, 91622};
                List<Integer> integers = Arrays.asList(objects);
                if (!integers.contains(id)) {
                    continue;
                }
                Where<MoviesColor, Integer> eq = moviesColorIntegerQueryBuilder.where().eq("movie_id", id).
                        and().in("movie_id", objects);
                if (eq.query().isEmpty()) {
                    File fileMovie = new File(directory.getAbsolutePath() + "\\" + s);
                    long fileSizeInBytes = fileMovie.length();
                    long fileSizeInKB = fileSizeInBytes / 1024;
                    long fileSizeInMB = fileSizeInKB / 1024;
                    if (fileSizeInMB > 1000l) {
                        System.out.println("Arquivo muito grande");
                        continue;
                    }
                    System.out.println(fileSizeInMB + "Mb");
                    FileChannelWrapper writableFileChannel = NIOUtils.readableFileChannel(fileMovie);
                    FrameGrab grab = new FrameGrab(writableFileChannel);
                    MP4Demuxer demuxer = new MP4Demuxer(writableFileChannel);
                    AbstractMP4DemuxerTrack videoTrack = demuxer.getVideoTrack();
                    double scalar = videoTrack.getDuration().scalar();
                    final int totalFrames = videoTrack.getMeta().getTotalFrames();
                    //final double totalDuration = videoTrack.getMeta().getTotalDuration();
                    //double e = totalFrames / totalDuration;
                    //Double videoLength = videoTrack.getDuration().scalar();
                    //videoLength = videoLength - 1; //TAMANHO DO VIDEO
                    //grab.seekToSecondPrecise(7);

                    //Assumisse que os videos pussuem 30fps
                    //Se o video for maior do que 1h, pego um frame a cada 5 minutos
                    //Se o video for maior do que 30mim, pego um frame por minuto
                    //Se o video for menor do que 30mim
                    int frameIncrement = scalar > 6000 ? 9000 : scalar > 1800 ? 1800 : 10;

                    for (int i = 0; i < totalFrames; i = i + frameIncrement) {
                        if (i < totalFrames) {
                            try {
                                Picture nativeFrame = grab.seekToFramePrecise(i).getNativeFrame();
                                putColorOnMap(AWTUtil.toBufferedImage(nativeFrame));
                                int percent = ((i * 100) / totalFrames);
                                if (percent % 10 == 0) {
                                    System.out.print(percent + "% ");
                                }
                                //ImageIO.write(AWTUtil.toBufferedImage(nativeFrame), "png", new File(System.getProperty("user.home"), String.format("Desktop/aqui/frame_%08d.png", i)));
                            } catch (Exception iOException) {
                                iOException.printStackTrace();
                            }
                        }
                    }
                    final int parseInt = Integer.parseInt(s.replace(".mp4", ""));
                    saveColorInDataBase(parseInt);
                    writableFileChannel.close();
                    videosColors = new HashMap<>();
                    System.out.println("100%");
                }
            } catch (Exception iOException) {
                iOException.printStackTrace();
                System.out.println("Falha: " + iOException.getMessage());
            }
        }
        /*File directory = new File("C:\\Users\\jon_j\\Downloads\\tube\\");
         File[] listFiles = directory.listFiles();
         for(File file : listFiles){
        
         }*/
    }

    private static void saveColorInDataBase(int movieId) throws SQLException {
        quantify();
        MovieColorPersistence colorPersistence = new MovieColorPersistence();
        List<Color> sortColors = sortColors(videosColors);
        for (Color c : sortColors) {
            Integer get = videosColors.get(c);
            MoviesColor moviesColor = new MoviesColor(new Movie(movieId), c, get);
            colorPersistence.create(moviesColor);
        }

    }

    private static void quantify() {
        List<Color> cores = new ArrayList<Color>(videosColors.keySet());
        List<Color> coresRemovidas = new ArrayList<Color>();

        removeBlack();

        for (Color c : cores) {
            for (Color c2 : cores) {
                if (!c.equals(c2) && !coresRemovidas.contains(c2)) {
                    double colorDifference = ColorUtil.getColorDifference(c.getRGB(), c2.getRGB());
                    if (colorDifference <= IGUALDADE_CORES) {
                        Integer valuePrimeiraCor = videosColors.get(c);
                        valuePrimeiraCor = valuePrimeiraCor == null ? 1 : valuePrimeiraCor;

                        Integer valueSegundaCor = videosColors.get(c2);
                        valueSegundaCor = valueSegundaCor == null ? 1 : valueSegundaCor;

                        videosColors.put(c, valuePrimeiraCor + valueSegundaCor);
                        videosColors.remove(c2);
                        coresRemovidas.add(c2);
                    }
                }
            }
        }
    }

    private static void removeBlack() {
        List<Color> cores = new ArrayList<Color>(videosColors.keySet());
        for (Color c : cores) {
            double colorDifference = ColorUtil.getColorDifference(c.getRGB(), Color.BLACK.getRGB());
            if (colorDifference <= IGUALDADE_CORES) {
                videosColors.remove(c);
            }
        }
    }

    private static void writeMoviesTxt(List<Color> cores) {
        try {
            FileWriter arq = new FileWriter("videoColors.txt");
            PrintWriter gravarArq = new PrintWriter(arq);
            for (int i = cores.size() - 1; i >= 0; i--) {
                Color cor = cores.get(i);
                String rbg = "R:" + cor.getRed() + " G:" + cor.getGreen() + " B:" + cor.getBlue();
                gravarArq.print(rbg);
                gravarArq.println(" " + videosColors.get(cor));
            }
            arq.close();
        } catch (IOException iOException) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", iOException.getMessage());
        }
    }

    private static HashMap<Color, Integer> findColors(BufferedImage image) {
        HashMap<Color, Integer> map = new HashMap<>();
        WritableRaster raster = image.getRaster();
        int[] arrayPixel = new int[3];
        for (int x = 0; x < image.getWidth(); x++) {
            for (int y = 0; y < image.getHeight(); y++) {
                int[] pixel = raster.getPixel(x, y, arrayPixel);

                Color color = new Color(pixel[0], pixel[1], pixel[2]);
                Integer get = map.get(color);
                map.put(color, get == null ? 1 : ++get);
            }
        }
        return map;
    }

    private static List<Color> sortColors(HashMap<Color, Integer> map) {
        Set<Color> keySet = map.keySet();
        List<Color> sorted = new ArrayList<Color>(keySet);
        for (int fixo = 0; fixo < sorted.size(); fixo++) {
            int menor = fixo;
            if (fixo + 1 != sorted.size()) {
                for (int i = menor + 1; i < sorted.size(); i++) {
                    if (map.get(sorted.get(i)) < map.get(sorted.get(menor))) {
                        menor = i;
                    }

                }
                if (menor != fixo) {
                    Color now = sorted.get(fixo);
                    sorted.set(fixo, sorted.get(menor));
                    sorted.set(menor, now);
                }
            }
        }
        /*
         for (int i = 1; i < sorted.size(); i++) {
         Color now = sorted.get(i);
         Integer valueNow = map.get(now);
         if (i + 1 != sorted.size()) {
         Color next = sorted.get(i + 1);
         Integer valueNext = map.get(next);
         if (valueNext > valueNow) {
         sorted.set(i, next);
         sorted.set(i + 1, now);
         }
         } else {
         break;
         }
         }*/
        return sorted;
    }

    private static void putColorOnMap(BufferedImage bufferedImage) {
        int[] color = ColorThief.getColor(bufferedImage);
        if (color != null) {
            Color c = new Color(color[0], color[1], color[2]);
            Integer get = videosColors.get(c);
            get = get == null ? 0 : get;
            videosColors.put(c, ++get);
        }
    }

    private boolean isSimilarToBlackOrWhite(Color color) {
        return (canBeSimilar(color.getRed(), color.getGreen()) && canBeSimilar(color.getGreen(), color.getBlue()));
    }

    private boolean canBeSimilar(int value1, int value2) {
        int result = value1 - value2;
        result = result < 0 ? result * -1 : result;
        return result <= 33;
    }

}
