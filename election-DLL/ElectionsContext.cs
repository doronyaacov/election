using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace election_DLL
{
    public partial class ElectionsContext : DbContext
    {
        public ElectionsContext()
        {
        }

        public ElectionsContext(DbContextOptions<ElectionsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Party> Partys { get; set; }
        public virtual DbSet<Voter> Voters { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-O02T5V8\\SQLEXPRESS;Initial Catalog=Elections;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Hebrew_CI_AS");

            modelBuilder.Entity<Party>(entity =>
            {
                entity.HasKey(e => e.PartyName)
                    .HasName("PK_dbPartys");

                entity.Property(e => e.PartyName)
                    .HasMaxLength(50)
                    .HasColumnName("partyName");

                entity.Property(e => e.Voters).HasColumnName("voters");
            });

            modelBuilder.Entity<Voter>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("ID");

                entity.Property(e => e.City)
                    .HasMaxLength(50)
                    .HasColumnName("city");

                entity.Property(e => e.EMail)
                    .HasMaxLength(50)
                    .HasColumnName("eMail");

                entity.Property(e => e.FullName)
                    .HasMaxLength(50)
                    .HasColumnName("fullName");

                entity.Property(e => e.Gender)
                    .HasMaxLength(50)
                    .HasColumnName("gender");

                entity.Property(e => e.IdDate)
                    .HasMaxLength(50)
                    .HasColumnName("idDate");

                entity.Property(e => e.IsVoted)
                    .HasMaxLength(50)
                    .HasColumnName("isVoted");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(50)
                    .HasColumnName("phoneNumber");

                entity.Property(e => e.VotedFor)
                    .HasMaxLength(50)
                    .HasColumnName("votedFor");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
